function ciphertext = xor_stream_cipher(plaintext, key)
% plaintext: a vector of characters representing the plaintext
% key: a vector of characters representing the secret key
% ciphertext: a vector of characters representing the encrypted text

% Convert plaintext and key to ASCII codes
plaintext_ascii = double(plaintext);
key_ascii = double(key);

% Repeat the key to generate keystream of the same length as plaintext
keystream_ascii = repmat(key_ascii, 1, ceil(length(plaintext_ascii) / length(key_ascii)));
keystream_ascii = keystream_ascii(1:length(plaintext_ascii));

% Perform XOR operation between plaintext and keystream
ciphertext_ascii = bitxor(plaintext_ascii, keystream_ascii);

% Convert ciphertext back to character vector
ciphertext = char(ciphertext_ascii);
end
