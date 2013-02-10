class String #dodajemy metode do predefiniowanej klasy String
  def shuffle
    self.split('').shuffle.join #self to nasz argument
  end
end
