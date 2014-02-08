class StoriesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @stories = Story.all
    
    @stories = Story.paginate :per_page => 10,
    						  :page => params[:page],
    						  :order => 'created_at DESC'
    						  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end 
  end
  
  def show
    @story = Story.find(params[:id])
    @user = current_user
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  def new
    @story = Story.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end
  
  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  def create
    #@story = Story.new(params[:story])
    @story = current_user.stories.create(params[:story])
    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: "Your story has been pitched! Nice job!" }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])
	
	respond_to do |format|
	  if @story.update_attributes(params[:story])
	    format.html { redirect_to @story, notice: "You've updated your story! Lookin' good!" }
	    format.json { head :no_content }
	  else
	    format.html { render action: "edit" }
	    format.json { render json: @story.errors, status: :unprocessable_entity }
	  end
	end
  end
	
  # DELETE /pitches/1
  # DELETE /pitches/1.json
  def destroy
    @story = Story.find(params[:id])
	@story.destroy
	
	respond_to do |format|
	  format.html { redirect_to stories_url }
	  format.json { head :no_content }
	end
  end
  
end