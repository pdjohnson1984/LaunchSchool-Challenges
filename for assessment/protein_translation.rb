class Translation
  PROTEINS = {'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
              'UUC' => 'Phenylalanine', 'UUA' => 'Leucine', 'UUG' => 'Leucine',
              'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine',
              'UCG' => 'Serine', 'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
              'UGU' => 'Cysteine', 'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
              'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP'}
  INVALID_CODONS = /[^AUGC]/

  def self.of_codon(code)
    get_protein(code.split).join
  end

  def self.of_rna(code)
    proteins = get_protein(code.scan(/.../))

    proteins.include?('STOP') ? proteins.first(proteins.index('STOP')) : proteins
  end

  def self.get_protein(sequence)
    sequence.map do |codon|
      raise InvalidCodonError unless PROTEINS.include?(codon)

      PROTEINS[codon]
    end
  end
end

class InvalidCodonError < StandardError; end
