
def ceasar_cipher_decrypt(text, offset)
    ascii = text.chars.map { |c| c.ord }
    shifted = ascii.map { |c| c + offset }
    answer = shifted.map { |c| c.chr }.join
end