class EventSheetController < ApplicationController
  class IdolUnit
    #             idolid psidols psidolid events choices */
    attr_accessor :pi,   :pp,    :ppi,    :pe,   :pc
    attr_accessor :s1i,  :s1s,   :s1si,   :s1e,  :s1c
    attr_accessor :s2i,  :s2s,   :s2si,   :s2e,  :s2c
    attr_accessor :s3i,  :s3s,   :s3si,   :s3e,  :s3c
    attr_accessor :s4i,  :s4s,   :s4si,   :s4e,  :s4c
    attr_accessor :gi,   :gs,    :gsi,    :ge,   :gc
  end
  # params[:*s],@u.*s
  def i_select(p, s)
    if s.size == 0 then
      return '0'
    end
    if p == nil then
      return s[0].id.to_s
    else
      return s.find(){|i| i.id.to_s == p }.id.to_s rescue s[0].id.to_s
    end
  end
  def index
    @lidol = Idol.all

    # @u idolunit
    @u = IdolUnit.new
    @u.pi  = i_select(params[:pi], @lidol)
    @u.pp  = Pidol.all.find_all(){|i| i.modelid == @u.pi.to_i}
    @u.ppi = i_select(params[:pp], @u.pp)

    @u.s1i  = i_select(params[:s1i], @lidol)
    @u.s1s  = Sidol.all.find_all(){|i| i.modelid == @u.s1i.to_i}
    @u.s1si = i_select(params[:s1s], @u.s1s)

    @u.s2i  = i_select(params[:s2i], @lidol)
    @u.s2s  = Sidol.all.find_all(){|i| i.modelid == @u.s2i.to_i}
    @u.s2si = i_select(params[:s2s], @u.s2s)

    @u.s3i  = i_select(params[:s3i], @lidol)
    @u.s3s  = Sidol.all.find_all(){|i| i.modelid == @u.s3i.to_i}
    @u.s3si = i_select(params[:s3s], @u.s3s)

    @u.s4i  = i_select(params[:s4i], @lidol)
    @u.s4s  = Sidol.all.find_all(){|i| i.modelid == @u.s4i.to_i}
    @u.s4si = i_select(params[:s4s], @u.s4s)

    @u.gi  = i_select(params[:gi], @lidol)
    @u.gs  = Sidol.all.find_all(){|i| i.modelid == @u.gi.to_i}
    @u.gsi = i_select(params[:gs], @u.gs)

    @eventlist = EventList.all.find_all(){|e|
      (e.model == 'idol'  && e.modelid.to_s == @u.pi)   ||
      (e.model == 'pidol' && e.modelid.to_s == @u.ppi)  ||
      (e.model == 'sidol' && e.modelid.to_s == @u.s1si) ||
      (e.model == 'sidol' && e.modelid.to_s == @u.s2si) ||
      (e.model == 'sidol' && e.modelid.to_s == @u.s3si) ||
      (e.model == 'sidol' && e.modelid.to_s == @u.s4si) ||
      (e.model == 'sidol' && e.modelid.to_s == @u.gsi)
    }
    @choicelist = Choice.all
p @eventlist
p @choicelist
  end
end
