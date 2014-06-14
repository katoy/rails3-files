# -*- coding: utf-8 -*-

class DownloadsController < ApplicationController

  include DownloadsHelper

  def get_perPage
    (cookies[:per_page] || 10).to_i
  end

  # GET /downloads
  # GET /downloads.json
  def index
    @downloads = Download.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @downloads }
    end
  end

  # GET /downloads/indexKaminari
  # GET /downloads/indexKaminari.json
  def indexKaminari
    @sort = nil
    @direction = nil
    @sort = params[:sort] if params[:sort]
    @direction = params[:direction] if params[:direction]

    @sort = 'id'       if @sort == nil
    @direction = 'asc' if @direction == nil

    if params[:search]
      @downloads = Download.where("name like :search", search: params[:search]).order("#{@sort} #{@direction}").page(params[:page]).per(get_perPage)
    else
      puts "--------- sort:[#{@sort}], direction:[#{@direction}] ----"
      @downloads = Download.order("#{@sort} #{@direction}").page(params[:page]).per(get_perPage)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @downloads }
      format.js
    end
  end

  # GET /downloadsTable/indexKaminari
  # GET /downloadsTable/indexKaminari.json
  def indexKaminariTable

    @sort = nil
    @direction = nil
    @sort = params[:sort] if params[:sort]
    @direction = params[:direction] if params[:direction]

    @sort = 'id'       if @sort == nil
    @direction = 'asc' if @direction == nil
    if params[:search]
      @downloads = Download.where("name like :search", search: params[:search]).order("#{@sort} #{@direction}").page(params[:page]).per(get_perPage)
    else
      @downloads = Download.order("#{@sort} #{@direction}").page(params[:page]).per(get_perPage)
    end

  end

  # GET /downloads/indexWiceGrid
  # GET /downloads/indexWiceGrid.json
  def indexWicegrid
    @downloads_grid = initialize_grid(Download,
                                      per_page: get_perPage,
                                      order: "id",
                                      order_direction: :desc,
                                      name: 'grid',
                                      enable_export_to_csv: true,
                                      csv_file_name:        'downloads',
                                      )

    return if export_grid_if_requested
    respond_to do |format|
      format.html # index.html.erb
    #  format.json { render json: @downloads_grid }
    end
  end

  # GET /downloads/1
  # GET /downloads/1.json
  def show
    @download = Download.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @download }
    end
  end

  # GET /downloads/new
  # GET /downloads/new.json
  def new
    @download = Download.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @download }
    end
  end

  # GET /downloads/1/edit
  def edit
    @download = Download.find(params[:id])
  end

  # POST /downloads
  # POST /downloads.json
  def create
    @download = Download.new(params[:download])

    respond_to do |format|
      if @download.save
        format.html { redirect_to @download, notice: 'Download was successfully created.' }
        format.json { render json: @download, status: :created, location: @download }
      else
        format.html { render action: "new" }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /downloads/1
  # PUT /downloads/1.json
  def update
    @download = Download.find(params[:id])

    respond_to do |format|
      if @download.update_attributes(params[:download])
        format.html { redirect_to @download, notice: 'Download was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /downloads/1
  # DELETE /downloads/1.json
  def destroy
    @download = Download.find(params[:id])
    @download.destroy

    respond_to do |format|
      format.html { redirect_to downloads_url }
      format.json { head :no_content }
    end
  end


  # See http://maskana-soft.com/rails/pro/body/63
  #     ファイルのダウンロードができるようにしよう(send_file,send_data)
  def act1
    dl = Download.find(params[:id])
    send_file("./public/#{dl.path}") if dl
  end
end
