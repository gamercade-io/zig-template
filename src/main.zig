const gc = @import("gamercade");

var frameCounter: usize = 0;
var xPos: i32 = 0;
var yPos: i32 = 0;

// Called once, at the start of the game.
export fn init() void {
    gc.consoleLog("Hello, from Zig!");

    xPos = @intCast(i32, gc.width() / 2);
    yPos = @intCast(i32, gc.height() / 2);
}

// Called once every frame, before draw.
export fn update() void {
    // Print a message if the user presses the A button.
    // This defaults to the U key on the keyboard.
    if (gc.buttonAPressed(0)) |state| {
        if (state) {
            gc.consoleLog("Pressed A.");
        }
    }

    // Let's move the pixel with the arrow keys
    // Handle up/down motion
    if (gc.buttonUpHeld(0)) |state| {
        if (state) {
            yPos -= 1;
        }
    }

    if (gc.buttonDownHeld(0)) |state| {
        if (state) {
            yPos += 1;
        }
    }

    // And repeat for left/right
    if (gc.buttonLeftHeld(0)) |state| {
        if (state) {
            xPos -= 1;
        }
    }

    if (gc.buttonRightHeld(0)) |state| {
        if (state) {
            xPos += 1;
        }
    }

    // Update the frame counter to keep the animation looping
    frameCounter += 1;
}

// Called once every frame, after update.
export fn draw() void {
    // Clear screen function takes a GraphicsParameters as a parameter,
    // so let's make one.
    var clearColor = gc.colorIndex(0);

    // Now, we can clear the screen.
    gc.clearScreen(clearColor);

    // Let's draw a pixel.
    var pixelColor = gc.colorIndex(16);
    gc.setPixel(pixelColor, xPos, yPos);

    // Let's draw a spinning pixel.
    var spinningPixelColor = gc.colorIndex(9);

    // Make it spin around
    var frame = @intToFloat(f32, frameCounter);
    var x = @sin(frame * 0.1) * 25.0;
    var y = @cos(frame * 0.1) * 25.0;

    x += @intToFloat(f32, xPos);
    y += @intToFloat(f32, yPos);

    // Draw the spinning pixel
    gc.setPixel(spinningPixelColor, @floatToInt(i32, x), @floatToInt(i32, y));
}
