def score_game(game, frame_count = 10)
  if frame_count == 0
    return 0
  else
    if game[0] == "X"
      return score_frame(game[0..2]) + score_game(game[1..-1], frame_count-1)
    elsif game[1] == "/"
      return score_frame(game[1..2]) + score_game(game[2..-1], frame_count-1)
    else
      return score_frame(game[0..1]) + score_game(game[2..-1], frame_count-1)
    end
  end
end

def score_roll(roll)
  case roll
  when "X" then 10
  when "/" then 10
  when "-" then 0
  when "1".."9" then roll.to_i
  end
end

def score_frame(frame)
  spare = (frame =~ /\d\//)
  rolls = frame.chars
  rolls.delete_at(spare) if spare
  rolls.reduce(0) { |frame_score, roll| frame_score + score_roll(roll) }
end
