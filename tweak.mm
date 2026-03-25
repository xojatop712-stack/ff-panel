#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Menu.h"
#import "KittyMemory/KittyMemory.hpp"

// Ghidra-dan topgan offsetlaringiz
uint64_t AIMBOT_OFFSET = 0x109c1f230; 
uint64_t ESP_OFFSET = 0x108fc3339;

// Patch funksiyasi (KittyMemory orqali - bu xavfsizroq)
void applyPatch(uint64_t offset, uint32_t data) {
    uintptr_t address = _dyld_get_image_header(0) + offset;
    // ARM64 uchun 4 baytli patch
    MemoryPatch::createWithBytes(address, &data, 4).Modify();
}

// Menyu sozlamalari
void setupMenu() {
    [Menu createMenu:@"GEMINI MODS" description:@"Free Fire iOS Panel" icon:@""];

    [Menu addSwitch:@"Aimbot 100%" description:@"Headshotni yoqish" callback:^(BOOL isOn) {
        if (isOn) {
            applyPatch(AIMBOT_OFFSET, 0xD2800020); // MOV X0, #1
        } else {
            // Asl holiga qaytarish (Ghidra-dagi original baytlar)
            applyPatch(AIMBOT_OFFSET, 0x3933fc08); 
        }
    }];

    [Menu addSwitch:@"ESP / Antena" description:@"Dushmanni ko'rish" callback:^(BOOL isOn) {
        if (isOn) {
            applyPatch(ESP_OFFSET, 0xD2800020);
        } else {
            applyPatch(ESP_OFFSET, 0x697350); // Bu yerga original baytni qo'yish mumkin
        }
    }];
}

// O'yin ishga tushganda menyuni yuklash
__attribute__((constructor))
static void initialize() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        setupMenu();
    });
}