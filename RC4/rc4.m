function encrypted_text = rc4(key, plain_text)
% key: the encryption key
% plain_text: the text to be encrypted
% encrypted_text: the encrypted text

% Initialization
key_length = length(key);
s = 0:255;
k = zeros(1, 256);

% KSA (Key Scheduling Algorithm)
for i = 0:255
    k(i+1) = key(mod(i, key_length)+1);
end

j = 0;
for i = 0:255
    j = mod(j + s(i+1) + k(i+1), 256);
    tmp = s(i+1);
    s(i+1) = s(j+1);
    s(j+1) = tmp;
end

% PRGA (Pseudo-Random Generation Algorithm)
i = 0;
j = 0;
encrypted_text = '';
for n = 1:length(plain_text)
    i = mod(i+1, 256);
    j = mod(j+s(i+1), 256);
    tmp = s(i+1);
    s(i+1) = s(j+1);
    s(j+1) = tmp;
    t = mod(s(i+1)+s(j+1), 256);
    encrypted_text(n) = bitxor(plain_text(n), s(t+1));
end

encrypted_text = char(encrypted_text);
end