#!/usr/bin/env ruby

def process(instruction, a, b, dest)
  if instruction == 1
    @memory[dest] = @memory[a] + @memory[b]
  elsif instruction == 2
    @memory[dest] = @memory[a] * @memory[b]
  elsif instruction == 99
    @return = @memory[0]
    return false
  else
    return nil
  end
  return true
end

def run_program(program, noun, verb)
  @memory = program.clone
  @memory[1] = noun
  @memory[2] = verb
  running = true
  read_head = 0
  while running == true do
    running = process(@memory[read_head], @memory[read_head + 1], @memory[read_head + 2], @memory[read_head + 3])
    read_head += 4
  end
  #unless running.nil?
  if @return == 19690720
    puts "N: #{noun}, V: #{verb}"
    puts @return
    puts "Answer: #{100 * noun + verb}"
  end
end

program = []

File.open('input').each do | instruction |
  program = instruction.split(',').map { |e| e.to_i }
end

(0...program.length).each do |noun|
  (0...program.length).each do |verb|
    run_program(program, noun, verb)
  end
end
