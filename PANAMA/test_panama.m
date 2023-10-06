% Split the key into two 64-bit parts
key_part1 = hex2dec('0123456789abcdef');
key_part2 = hex2dec('0123456789abcdef');

% Convert each part to a binary string
key_part1_str = dec2bin(key_part1, 64);
key_part2_str = dec2bin(key_part2, 64);

% Concatenate the two parts to form the 128-bit key
key_str = [key_part1_str key_part2_str];

% Convert the binary string to a binary vector
key = reshape(str2num(key_str')', 1, []);

% Repeat the process for the IV
iv_part1 = hex2dec('fedcba9876543210');
iv_part2 = hex2dec('fedcba9876543210');
iv_part1_str = dec2bin(iv_part1, 64);
iv_part2_str = dec2bin(iv_part2, 64);
iv_str = [iv_part1_str iv_part2_str];
iv = reshape(str2num(iv_str')', 1, []);

plaintext = 'Hello, world!';
ciphertext = panama(key, iv, plaintext);
disp(ciphertext);
