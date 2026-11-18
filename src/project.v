/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_arche (
    input  wire [7:0] ui_in,    // 전용 입력 핀
    output wire [7:0] uo_out,   // 전용 출력 핀
    input  wire [7:0] uio_in,   // 양방향 핀 (입력 경로)
    output wire [7:0] uio_out,  // 양방향 핀 (출력 경로)
    output wire [7:0] uio_oe,   // 양방향 핀 방향 제어 (1=출력, 0=입력)
    input  wire       ena,      // 디자인 활성화 신호 (항상 1)
    input  wire       clk,      // 클럭
    input  wire       rst_n     // 액티브 로우 리셋 (0일 때 리셋)
);

  // 미사용 출력 핀은 반드시 0으로 고정해야 합성 경고가 안 뜹니다
  assign uo_out  = ui_in;
  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  // 미사용 입력 핀 경고 방지용
  wire _unused = &{ena, clk, rst_n, uio_in, 1'b0};

endmodule