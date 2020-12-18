# Shift each character in the string (according to ascii value)
# by the given offset value.
def ceasar_cipher_decrypt(text, offset)
    ascii = text.chars.map { |c| c.ord }
    shifted = ascii.map { |c| c + offset }
    decrypted_text = shifted.map { |c| c.chr }.join
end