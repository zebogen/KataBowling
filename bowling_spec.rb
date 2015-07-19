require_relative 'bowling'

describe 'score_game' do
  let(:perfect_game) { "XXXXXXXXXXXX" }
  let(:nines_gutters) { "9-9-9-9-9-9-9-9-9-9-" }
  let(:fives_spares) { "5/5/5/5/5/5/5/5/5/5/5" }
  let(:gutters_spares) { "-/-/-/-/-/-/-/-/-/-/-" }
  let(:womp_womp) { "--------------------" }
  let(:mixed_game_1) { "369-134/X2/11XX1/4" }
  let(:mixed_game_2) { "----X-13/-/X14X-/X" }

  it 'should return 300 for a game of all strikes' do
    expect(score_game(perfect_game)).to eq(300)
  end

  it 'should return 90 for a game of all nines followed by gutter balls' do
    expect(score_game(nines_gutters)).to eq(90)
  end

  it 'should return 150 for a game where every roll hits five pins' do
    expect(score_game(fives_spares)).to eq(150)
  end

  it 'should return 100 for a game of all gutter balls followed by spares' do
    expect(score_game(gutters_spares)).to eq(100)
  end

  it 'should return 0 for a game of all gutter balls' do
    expect(score_game(womp_womp)).to eq(0)
  end

  it 'should return 130 for mixed_game_1' do
    expect(score_game(mixed_game_1)).to eq(130)
  end

  it 'should return 102 for mixed_game_2' do
    expect(score_game(mixed_game_2)).to eq(102)
  end

end
