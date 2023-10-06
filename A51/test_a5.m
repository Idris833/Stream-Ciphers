% Test script for A5/1 cipher

% Set the key and frame values
key = hex2dec('2B7E151628AED2A6');
frame = hex2dec('3243F6A8885A308D');

% Set the plaintext
plaintext = 'Hello, world!';

% Convert the plaintext to ASCII values
plaintext_ascii = uint8(plaintext);

% Convert the ASCII values to binary format
plaintext_binary = reshape(dec2bin(plaintext_ascii, 8)', 1, []) == '1';

% Set the length of the plaintext binary
length = numel(plaintext_binary);

% Generate the keystream
output = a5_1(key, frame, length);

% Convert the logical output to double
output = double(output);
% Perform bitwise XOR between plaintext binary and keystream
ciphertext_binary = bitxor(output, plaintext_binary);

% Convert the ciphertext binary to decimal in chunks
ciphertext_decimal = zeros(1, ceil(length/8));
for i = 1:ceil(length/8)
    start_idx = (i-1)*8 + 1;
    end_idx = min(i*8, length);
    ciphertext_decimal(i) = bin2dec(num2str(ciphertext_binary(start_idx:end_idx)));
end

% Convert the decimal values to characters
ciphertext = char(ciphertext_decimal);

% Display the ciphertext
disp('Plaintext:');
disp(plaintext);
disp('Ciphertext:');
disp(ciphertext);

message_binary = bitxor(output, ciphertext_binary);
message_decimal = zeros(1, ceil(length/8));
for i = 1:ceil(length/8)
    start_idx = (i-1)*8 + 1;
    end_idx = min(i*8, length);
    message_decimal(i) = bin2dec(num2str(message_binary(start_idx:end_idx)));
end

original_message = char(message_decimal);
disp('Decrypted message: ');
disp(original_message);

