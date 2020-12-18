# Shift each character in the string (according to ascii value)
# by the given offset value.
def ceasar_cipher_decrypt(text, offset)

    # Note this is my implementation and may differ from
    # others regarding the upper and lower bounds
    # of printable characters. If any ceasar cipher is used
    # in the solution, it would be this one.
    buffer = ""
    text.chars.each do |c|
        ordinal = c.ord
        new_ordinal = ordinal + offset
        # Keep the characters within a somewhat normal
        # printable range
        if new_ordinal < 32
            new_ordinal = 127 - (32 - new_ordinal)
        elsif new_ordinal > 126
            new_ordinal = 31 + (new_ordinal - 126)
        end
        new_char = new_ordinal.chr
        buffer = buffer + new_char
    end
    buffer
end