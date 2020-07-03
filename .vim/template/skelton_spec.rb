# frozen_string_literal: true

require 'spec_helper'

describe [:VIM_EVAL:]substitute(expand("%:t:r"), '\(^\|_\)\(.\)', '\u\2', 'g')[:END_EVAL:] do

  before(:all) do

  end

  after(:all) do

  end

  it "test" do
    expect(true).to be_truthy
  end

end
