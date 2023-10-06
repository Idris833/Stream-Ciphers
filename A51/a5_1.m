function output = a5_1(key, frame, length)
    % Convert the frame to an array of bits
    frame_bits = bitget(frame, 1:64, 'uint64')';

    % Initialize the shift registers
    R1 = ones(1, 19);
    R2 = ones(1, 22);
    R3 = ones(1, 23);

    % Load the key into the shift registers
    key_bits = bitget(key, 1:64, 'uint64')';
    R1(1:64) = key_bits;
    R2(1:64) = key_bits;
    R3(1:64) = key_bits;

    % Initialize the output stream
    output = zeros(1, length);

    % Generate the keystream
    for i = 1:length
        % Majority function
        majority = bitxor(bitand(R1(8), R2(10)), ...
            bitxor(bitand(R1(8), R3(10)), bitand(R2(10), R3(10))));

        % Generate the output bit
        output(i) = bitxor(majority, bitxor(R1(18), R2(21)));

        % Shift the registers
        R1 = [bitxor(R1(13), R1(16)), R1(1:18)];
        R2 = [bitxor(R2(20), R2(21)), R2(1:21)];
        R3 = [bitxor(R3(7), R3(20)), R3(1:22)];

        % Load the next bit of the frame into R1
        frame_bit_index = mod(i-1, 64) + 1;
        R1(1) = frame_bits(frame_bit_index);
    end
end
