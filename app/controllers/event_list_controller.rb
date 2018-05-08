class EventListController < ApplicationController
  # local variables
  class ExpandedEvent
    attr_accessor :idol, :idoltype, :idolid
    attr_accessor :event, :eventid
    attr_accessor :choices
    class RelatedChoice
      attr_accessor :choice, :choiceid, :Vo, :Da, :Vi, :Me, :Sp
      def initialize(id)
        c = Choice.find(id) rescue nil
        if c != nil then
          self.choiceid = id
          self.choice   = c.name
          self.Vo = c.Vo
          self.Da = c.Da
          self.Vi = c.Vi
          self.Me = c.Me
          self.Sp = c.Sp
        else
          self.choiceid = 0
          self.choice   = ''
          self.Vo = 0
          self.Da = 0
          self.Vi = 0
          self.Me = 0
          self.Sp = 0
        end
      end
    end

    def initialize(id)
      ev = EventList.find(id) rescue nil
      if ev != nil then
        self.eventid = ev.id
        self.event   = ev.name

        if 'idol' == ev.model then
          ido = Idol.all.find(){|i| i.id == ev.modelid}
          self.idoltype = ev.model
          self.idolid   = ido.id
          self.idol     = ido.name
        elsif 'pidol' == ev.model then
          pido = Pidol.all.find(){|i| i.id == ev.modelid}
          if pido != nil then
            ido  = Idol.all.find(){|i| i.id == pido.modelid}
            self.idoltype = ev.model
            self.idolid   = pido.id
            self.idol     = "【#{pido.name}】#{ido.name}"
          else
            ido = Idol.all.find(){|i| i.id == ev.modelid}
            self.idoltype = ev.model
            self.idolid   = ido.id
            self.idol     = ido.name
          end
        end

        self.choices = Array.new
        ch = Choice.all.find_all(){|c| c.event == ev.id}
        ch.each { |c|
          self.choices << RelatedChoice.new(c.id)
        }
        if self.choices.size == 0
          # set empty dummy choice
          self.choices << RelatedChoice.new(0)
        end
      else
        self.eventid = 0
        self.event   = ''

        self.idoltype = 'idol'
        self.idolid  = 0
        self.idol    = ''

        self.choices = Array.new
        self.choices << RelatedChoice.new(0)
      end
    end
  end

  # controller method
  def index
    @msg = 'イベントリストです'
    eventlist  = EventList.all

    @data = Array.new
    eventlist.each {|ev|
      @data << ExpandedEvent.new(ev.id)
    }
  end
  def edit_event
    @msg = 'イベント編集画面です'
    @data = ExpandedEvent.new(params[:id])
    if params[:model] != nil
      @data.idoltype = params[:model]
    end
    if @data.idoltype == 'pidol' then
      @idollist = Pidol.all
      @realname = Idol.all
    else
      @idollist = Idol.all
      @realname = nil
    end

    # form_for objects
    @event  = EventList.new
  end
  def edit_choice
    @msg = 'choice編集画面です'
    @data = ExpandedEvent.new(params[:eventid])

    # form_for objects
    @choiceid = params[:id]
    @choice = Choice.new
  end
  def update_event
    if request.post? then
      ev = EventList.find(params[:id]) rescue nil
      if ev == nil then
        EventList.create(params.require(:event_list).permit(:model,
                                                            :modelid,
                                                            :name))
      else
        ev.update(params.require(:event_list).permit(:model,
                                                     :modelid,
                                                     :name))
      end
    end
    redirect_to '/event_list'
  end
  def delete_event
    EventList.find(params[:id]).destroy rescue false
    redirect_to '/event_list'
  end
  def update_choice
    if request.post? then
      c = Choice.find(params[:id]) rescue nil
      if c == nil then
        Choice.create(params.require(:choice).permit(:event,
                                                     :name,
                                                     :Vo,
                                                     :Da,
                                                     :Vi,
                                                     :Me,
                                                     :Sp))
      else
        c.update(params.require(:choice).permit(:event,
                                                :name,
                                                :Vo,
                                                :Da,
                                                :Vi,
                                                :Me,
                                                :Sp))
      end
    end
    redirect_to '/event_list'
  end
  def delete_choice
    Choice.find(params[:id]).destroy rescue false
    redirect_to '/event_list'
  end
end
