#include <stdio.h>
#include <stdlib.h>
#include <gpiod.h>
#include <unistd.h>

#define GPIO_CHIP "/dev/gpiochip0"
#define GPIO_PIN  1  // GPIO pin 1

int main() {
    struct gpiod_chip *chip;
    struct gpiod_line *line;
    int ret;

    // Open the GPIO chip
    chip = gpiod_chip_open(GPIO_CHIP);
    if (!chip) {
        perror("Failed to open GPIO chip");
        return EXIT_FAILURE;
    }

    // Get the GPIO line (pin 1)
    line = gpiod_chip_get_line(chip, GPIO_PIN);
    if (!line) {
        perror("Failed to get GPIO line");
        gpiod_chip_close(chip);
        return EXIT_FAILURE;
    }

    // Request the GPIO line as an output
    ret = gpiod_line_request_output(line, "gpio_output", 0); // 0 for low initially
    if (ret < 0) {
        perror("Failed to request GPIO line as output");
        gpiod_chip_close(chip);
        return EXIT_FAILURE;
    }

    // Set the GPIO pin value to HIGH (1)
    ret = gpiod_line_set_value(line, 1);
    if (ret < 0) {
        perror("Failed to set GPIO value");
        gpiod_chip_close(chip);
        return EXIT_FAILURE;
    }

    printf("GPIO pin %d on %s set to HIGH (1)\n", GPIO_PIN, GPIO_CHIP);

    // Clean up and close the chip
    gpiod_chip_close(chip);

    return EXIT_SUCCESS;
}

