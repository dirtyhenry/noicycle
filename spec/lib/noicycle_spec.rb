# frozen_string_literal: true

require 'spec_helper'

describe Noicycle do
  it 'returns a hash with as many results as requested when the reference date is old enough' do
    noicycle = Noicycle::Noicycle.new
    ref_date = Date.parse('5th May 2013')
    (3..5).each do |i|
      tapes = noicycle.tapes(ref_date, i)
      expect(tapes.size).to eq(i)
    end
  end

  it 'returns the right result for a given example DAILY' do
    noicycle = Noicycle::Noicycle.new
    ref_date = Date.parse('5th May 2013')
    cur_date = Date.parse('24th September 2013')
    tapes = noicycle.tapes(ref_date, 7, cur_date)

    expect(tapes.size).to eq(7)
    expect(tapes[1]).to eq Date.parse('23rd September 2013')
    expect(tapes[2]).to eq Date.parse('24th September 2013')
    expect(tapes[3]).to eq Date.parse('22nd September 2013')
    expect(tapes[4]).to eq Date.parse('18th September 2013')
    expect(tapes[5]).to eq Date.parse('25th August 2013')
    expect(tapes[6]).to eq Date.parse('9th August 2013')
    expect(tapes[7]).to eq Date.parse('10th September 2013')
  end

  it 'returns the right result for a given example WEEKLY' do
    noicycle = Noicycle::Noicycle.new
    ref_date = Date.parse('5th May 2013')
    cur_date = Date.parse('24th September 2013')
    tapes = noicycle.tapes(ref_date, 7, cur_date, weekly: true)

    expect(tapes.size).to eq(6)
    expect(tapes[1]).to eq Date.parse('15th September 2013')
    expect(tapes[2]).to eq Date.parse('8th September 2013')
    expect(tapes[3]).to eq Date.parse('22nd September 2013')
    expect(tapes[4]).to eq Date.parse('30th June 2013')
    expect(tapes[5]).to eq Date.parse('25th August 2013')
    expect(tapes[6]).to eq nil
    expect(tapes[7]).to eq Date.parse('5th May 2013')
  end
end
