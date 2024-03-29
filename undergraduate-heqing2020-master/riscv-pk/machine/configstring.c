#include "configstring.h"
#include "encoding.h"
#include "mtrap.h"
#include "atomic.h"
#include "string.h"
#include <stdio.h>

static void query_mem(const char* config_string)
{
  //query_result res = query_config_string(config_string, "ram{0{addr");
  //assert(res.start);
  //uintptr_t base = get_uint(res);
  uintptr_t base = (uintptr_t)0x80000000;
  assert(base == DRAM_BASE);
  //res = query_config_string(config_string, "ram{0{size");
  //mem_size = get_uint(res);
  mem_size = (uint64_t)0x00200000;
}

static void query_rtc(const char* config_string)
{
  //query_result res = query_config_string(config_string, "rtc{addr");
  //assert(res.start);
  //mtime = (void*)(uintptr_t)get_uint(res);
  mtime = (void*)(uintptr_t)0x40000000;
}

static void query_plic(const char* config_string)
{
#if 0
  query_result res = query_config_string(config_string, "plic{priority");
  if (!res.start)
    return;
  plic_priorities = (uint32_t*)(uintptr_t)get_uint(res);

  res = query_config_string(config_string, "plic{ndevs");
  if (!res.start)
    return;
  plic_ndevs = get_uint(res);
#else
  return;
#endif
}

static void query_hart_plic(const char* config_string, hls_t* hls, int core, int hart)
{
#if 0
  char buf[48];
  snprintf(buf, sizeof buf, "core{%d{%d{plic{m{ie", core, hart);
  query_result res = query_config_string(config_string, buf);
  if (res.start)
    hls->plic_m_ie = (void*)(uintptr_t)get_uint(res);

  snprintf(buf, sizeof buf, "core{%d{%d{plic{m{thresh", core, hart);
  res = query_config_string(config_string, buf);
  if (res.start)
    hls->plic_m_thresh = (void*)(uintptr_t)get_uint(res);

  snprintf(buf, sizeof buf, "core{%d{%d{plic{s{ie", core, hart);
  res = query_config_string(config_string, buf);
  if (res.start)
    hls->plic_s_ie = (void*)(uintptr_t)get_uint(res);

  snprintf(buf, sizeof buf, "core{%d{%d{plic{s{thresh", core, hart);
  res = query_config_string(config_string, buf);
  if (res.start)
    hls->plic_s_thresh = (void*)(uintptr_t)get_uint(res);
#else
  return;
#endif
}

static void query_harts(const char* config_string)
{
  //for (int core = 0, hart; ; core++) {
    //for (hart = 0; ; hart++) {
    //  char buf[40];
    //  snprintf(buf, sizeof buf, "core{%d{%d{ipi", core, hart);
    //  query_result res = query_config_string(config_string, buf);
    //  if (!res.start)
    //    break;
      hls_t* hls = hls_init(num_harts);
      hls->ipi = (void*)(uintptr_t)0x40001000;

      //query_hart_plic(config_string, hls, core, hart);

      //snprintf(buf, sizeof buf, "core{%d{%d{timecmp", core, hart);
      //res = query_config_string(config_string, buf);
      //assert(res.start);
      hls->timecmp = (void*)(uintptr_t)0x40000008;

      mb();

      // wake up the hart
      *hls->ipi = 1;

      num_harts++;
    //}
    //if (!hart)
    //  break;
  //}
  assert(num_harts);
  assert(num_harts <= MAX_HARTS);
}

extern uintptr_t uart;
extern void fpga_uart_init(uint16_t);

static void query_uart(const char* config_string)
{
  //query_result res = query_config_string(config_string, "uart{0{type");
  //if(!res.start) return;

  //get_string(type, res);
  //if(strcmp(type, "UART16550IPCore") != 0) return;

  //res = query_config_string(config_string, "uart{0{addr");
  //assert(res.start);
  //uart = get_uint(res);
  uart = (uint32_t)0x02000000;
  //res = query_config_string(config_string, "uart{0{divclk");

  //uint16_t divclk = get_uint(res);

  //fpga_uart_init(divclk);
}

void parse_config_string()
{
  uint32_t addr = *(uint32_t*)CONFIG_STRING_ADDR;
  const char* s = (const char*)(uintptr_t)addr;
  query_mem(s);
  query_plic(s);
  query_rtc(s);
  query_harts(s);
  query_uart(s);
}
