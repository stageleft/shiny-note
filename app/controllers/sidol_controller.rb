class SidolController < ApplicationController
  class SidolElement
    attr_accessor :prefix, :sidolid, :idolid, :realname
    def name
      "【#{self.prefix}】#{self.realname}"
    end
    def initialize(id)
     s = Sidol.find(id) rescue nil
      if s != nil then
        self.sidolid  = id
        self.idolid   = s.modelid
        self.prefix   = s.name
        self.realname = Idol.find(s.modelid).name rescue ''
      else
        self.sidolid  = 0
        self.idolid   = 0
        self.prefix   = ''
        self.realname = ''
      end
    end
  end
  def index
    @msg      = 'list of support idol'
    @prefix   = Sidol.all
    @idolname = Idol.all

    @data = Array.new
    @prefix.each{|p|
      @data << SidolElement.new(p.id)
    }
  end
  def edit
    @msg      = 'edit support idol'
    @data     = SidolElement.new(params[:id])
    @idollist = Idol.all
    @sidol    = Sidol.new
  end
  def update
    if request.post? then
      s = Sidol.find(params[:id]) rescue nil
      if s == nil then
        Sidol.create(params.require(:sidol).permit(:modelid, :name))
      else
        s.update(params.require(:sidol).permit(:modelid, :name))
      end
    end
    redirect_to '/sidol'
  end
  def delete
    Sidol.find(params[:id]).destroy rescue false
    redirect_to '/sidol'
  end
end
