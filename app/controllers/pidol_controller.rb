class PidolController < ApplicationController
  class PidolElement
    attr_accessor :prefix, :pidolid, :idolid, :realname
    def name
      "【#{self.prefix}】#{self.realname}"
    end
    def initialize(id)
      p = Pidol.find(id) rescue nil
      if p != nil then
        self.pidolid  = id
        self.idolid   = p.modelid
        self.prefix   = p.name
        self.realname = Idol.find(p.modelid).name rescue ''
      else
        self.pidolid  = 0
        self.idolid   = 0
        self.prefix   = ''
        self.realname = ''
      end
    end
  end
  def index
    @msg      = 'index'
    @prefix   = Pidol.all
    @idolname = Idol.all

    @data = Array.new
    @prefix.each{|p|
      @data << PidolElement.new(p.id)
    }
  end
  def edit
    @msg      = 'edit'
    @data     = PidolElement.new(params[:id])
    @idollist = Idol.all
    @pidol    = Pidol.new
  end
  def update
    if request.post? then
      p = Pidol.find(params[:id]) rescue nil
      if p == nil then
        Pidol.create(params.require(:pidol).permit(:modelid, :name))
      else
        p.update(params.require(:pidol).permit(:modelid, :name))
      end
    end
    redirect_to '/pidol'
  end
  def delete
    Pidol.find(params[:id]).destroy rescue false
    redirect_to '/pidol'
  end
end
