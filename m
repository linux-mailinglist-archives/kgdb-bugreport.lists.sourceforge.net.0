Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189219AC83
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Apr 2020 15:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jJdFM-0007Wg-2F
	for lists+kgdb-bugreport@lfdr.de; Wed, 01 Apr 2020 13:17:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jJJ9S-0003xT-Uw
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YpMK/d7/B4LPguXsTCnM5DdCM57TVq35wm2Ni7jxD8A=; b=HlhmZGqEVXLuTr+XP2wZhhjoaT
 Zh3pOrsknFKeVwdhz4NxOcqg5rmUSMz6lh3QUHexTr8jL94PgTTujV+MEm3gVu03eZDaCLrEWO1pi
 mrMGaFuw8g3Dv70Ca92qx9Y8DEJExTQFG7O0hitlUjFM0bXbqvPU38GqMEHZlvdBREhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YpMK/d7/B4LPguXsTCnM5DdCM57TVq35wm2Ni7jxD8A=; b=CG6JgZgNSnR2kvU0aGpgg2G8D/
 3l8LG1hR83+pmpBVn0xyUIQ8xUEicFJ9jUZkm6iQmzsSfZ/NPhXlo69A+0VPi/tASbi+x5MvvzZzQ
 7JBrzodD4Ks86IBlDpKsiKcIc48omgCuppS780ekFk1Ph/0JITzv+fPNKZ1vSNhXyPN4=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJJ9R-00EF8z-0g
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:50:06 +0000
Received: by mail-pj1-f65.google.com with SMTP id l36so1238044pjb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 31 Mar 2020 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YpMK/d7/B4LPguXsTCnM5DdCM57TVq35wm2Ni7jxD8A=;
 b=NCdmA4lsHTndPVNoLyMdjQ9l1MgWvyCX3kJMEHN+I312L8Qmt7ujG/tDeVM3zmlPRz
 tnaS5M7WFxiTeEzBhcj3lgfylh6F/3cmGXpaQX+8TkYkSUTm9R7G5+TIWQGGgfZov9na
 0uG3QJIgUOThmyvhiAStQenU2rSXhapo9AraHZpydEf9VeZsiO2OiTBG3E3wMfiJFBYW
 /j8KVZTAzUC88BySIUlWK1+z63lt/xF6Co+UbRBro4mZbOCJSsm+wc+qwgBh6rdzS0bx
 kJL0Gy7ZhMM5DdBUt0KWsTgOnqA6aNttVgqUMXeZsT2kzdIp9JYTAelWWcw9MgadGj4/
 vHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YpMK/d7/B4LPguXsTCnM5DdCM57TVq35wm2Ni7jxD8A=;
 b=PdgtiLRqktCeoQEovzE8Hf+jygzVJGpnKlZ3l+04reQHhBNzjuBHnS2q4V1YmnyWgt
 QE/Cnj2h7d/wFxn6XRnF9v70x1XCQe4UIT8gIyIrfdQ6XD9cpjxRwKRp2ByMhprXEXEw
 iYVy4UxkEx4crlB+zcskdhZd/nBXRbU6CqlRsHsqQkdwuiGmcHP9nryIsaqX7eTbB1lK
 f6bI6wFZzgd8rJM24yAZk/o+IkPw9tEiw4Tp9DXK23VmjRWDb5p3BQh54Pu5vmnxL+4o
 voNtHHc4gOEmzDe72AExMSDyGh/5LalWtbPkvRXZTGKzfx7lFQ8uPtv2fw7isQ219YRw
 bxPA==
X-Gm-Message-State: AGi0PubEBxNZYf/H5dUqWWuoE9nIPBH1ARrIrMfx5XPuF+ecQY4C6DtE
 vLTiaaF1dLc5kJLCdlWIL4oqKMH3bgg=
X-Google-Smtp-Source: ADFU+vs1woMcO0ZFVkD+OSYFdQE+9tmBuzqzWa5ECIc+cGFJZI+p904O8atvbijpR1/8cl8UN0k1lw==
X-Received: by 2002:a62:ae06:: with SMTP id q6mr19015993pff.137.1585668227224; 
 Tue, 31 Mar 2020 08:23:47 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id g30sm12097660pgn.40.2020.03.31.08.23.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Mar 2020 08:23:46 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Tue, 31 Mar 2020 23:23:11 +0800
Message-Id: <1585668191-16287-6-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.3 DRUGS_ERECTILE_OBFU    Obfuscated reference to an erectile drug
 2.2 DRUGS_ERECTILE         Refers to an erectile drug
 -1.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJJ9R-00EF8z-0g
X-Mailman-Approved-At: Wed, 01 Apr 2020 13:17:31 +0000
Subject: [Kgdb-bugreport] [PATCH v2 5/5] riscv: Add SW single-step support
 for KDB
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In KGDB, the GDB in the host is responsible for the single-step operation
of the software. In other words, KGDB does not need to derive the next pc
address when performing a software single-step operation. KGDB just inserts
the break instruction at the indicated address according to the GDB
instructions. This approach does not work in KDB because the GDB does not
involve the KDB process. Therefore, this patch provides KDB a software
single-step mechanism to use.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/parse_asm.h | 214 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/kgdb.c           | 171 ++++++++++++++++++++++++++++-
 2 files changed, 384 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/parse_asm.h

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
new file mode 100644
index 000000000000..7e3291fcc8b6
--- /dev/null
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -0,0 +1,214 @@
+#include <linux/bits.h>
+
+/* The bit field of immediate value in I-type instruction */
+#define I_IMM_SIGN_OPOFF	31
+#define I_IMM_11_0_OPOFF	20
+#define I_IMM_SIGN_OFF		12
+#define I_IMM_11_0_OFF		0
+#define I_IMM_11_0_MASK		GENMASK(11, 0)
+
+/* The bit field of immediate value in J-type instruction */
+#define J_IMM_SIGN_OPOFF	31
+#define J_IMM_10_1_OPOFF	21
+#define J_IMM_11_OPOFF		20
+#define J_IMM_19_12_OPOFF	12
+#define J_IMM_SIGN_OFF		20
+#define J_IMM_10_1_OFF		1
+#define J_IMM_11_OFF		11
+#define J_IMM_19_12_OFF 	12
+#define J_IMM_10_1_MASK		GENMASK(9, 0)
+#define J_IMM_11_MASK		GENMASK(0, 0)
+#define J_IMM_19_12_MASK	GENMASK(7, 0)
+
+/* The bit field of immediate value in B-type instruction */
+#define B_IMM_SIGN_OPOFF	31
+#define B_IMM_10_5_OPOFF	25
+#define B_IMM_4_1_OPOFF		8
+#define B_IMM_11_OPOFF		7
+#define B_IMM_SIGN_OFF		12
+#define B_IMM_10_5_OFF		5
+#define B_IMM_4_1_OFF		1
+#define B_IMM_11_OFF		11
+#define B_IMM_10_5_MASK		GENMASK(5, 0)
+#define B_IMM_4_1_MASK		GENMASK(3, 0)
+#define B_IMM_11_MASK		GENMASK(0, 0)
+
+/* The register offset in RVG instruction */
+#define RVG_RS1_OPOFF		15
+#define RVG_RS2_OPOFF		20
+#define RVG_RD_OPOFF		7
+
+/* The bit field of immediate value in RVC J instruction */
+#define RVC_J_IMM_SIGN_OPOFF	12
+#define RVC_J_IMM_4_OPOFF	11
+#define RVC_J_IMM_9_8_OPOFF	9
+#define RVC_J_IMM_10_OPOFF	8
+#define RVC_J_IMM_6_OPOFF	7
+#define RVC_J_IMM_7_OPOFF	6
+#define RVC_J_IMM_3_1_OPOFF	3
+#define RVC_J_IMM_5_OPOFF	2
+#define RVC_J_IMM_SIGN_OFF	11
+#define RVC_J_IMM_4_OFF		4
+#define RVC_J_IMM_9_8_OFF	8
+#define RVC_J_IMM_10_OFF	10
+#define RVC_J_IMM_6_OFF		6
+#define RVC_J_IMM_7_OFF		7
+#define RVC_J_IMM_3_1_OFF	1
+#define RVC_J_IMM_5_OFF		5
+#define RVC_J_IMM_4_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_9_8_MASK	GENMASK(1, 0)
+#define RVC_J_IMM_10_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_6_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_7_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_3_1_MASK	GENMASK(2, 0)
+#define RVC_J_IMM_5_MASK	GENMASK(0, 0)
+
+/* The bit field of immediate value in RVC B instruction */
+#define RVC_B_IMM_SIGN_OPOFF	12
+#define RVC_B_IMM_4_3_OPOFF	10
+#define RVC_B_IMM_7_6_OPOFF	5
+#define RVC_B_IMM_2_1_OPOFF	3
+#define RVC_B_IMM_5_OPOFF	2
+#define RVC_B_IMM_SIGN_OFF	8
+#define RVC_B_IMM_4_3_OFF	3
+#define RVC_B_IMM_7_6_OFF	6
+#define RVC_B_IMM_2_1_OFF	1
+#define RVC_B_IMM_5_OFF		5
+#define RVC_B_IMM_4_3_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_7_6_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_2_1_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_5_MASK	GENMASK(0, 0)
+
+/* The register offset in RVC op=C0 instruction */
+#define RVC_C0_RS1_OPOFF	7
+#define RVC_C0_RS2_OPOFF	2
+#define RVC_C0_RD_OPOFF		2
+
+/* The register offset in RVC op=C1 instruction */
+#define RVC_C1_RS1_OPOFF	7
+#define RVC_C1_RS2_OPOFF	2
+#define RVC_C1_RD_OPOFF		7
+
+/* The register offset in RVC op=C2 instruction */
+#define RVC_C2_RS1_OPOFF	7
+#define RVC_C2_RS2_OPOFF	2
+#define RVC_C2_RD_OPOFF		7
+
+/* parts of opcode for RVG*/
+#define OPCODE_BRANCH		0x63
+#define OPCODE_JALR		0x67
+#define OPCODE_JAL		0x6f
+#define OPCODE_SYSTEM		0x73
+
+/* parts of opcode for RVC*/
+#define OPCODE_C_0		0x0
+#define OPCODE_C_1		0x1
+#define OPCODE_C_2		0x2
+
+/* parts of funct3 code for I, M, A extension*/
+#define FUNCT3_JALR		0x0
+#define FUNCT3_BEQ		0x0
+#define FUNCT3_BNE		0x1000
+#define FUNCT3_BLT		0x4000
+#define FUNCT3_BGE		0x5000
+#define FUNCT3_BLTU		0x6000
+#define FUNCT3_BGEU		0x7000
+
+/* parts of funct3 code for C extension*/
+#define FUNCT3_C_BEQZ		0xc000
+#define FUNCT3_C_BNEZ		0xe000
+#define FUNCT3_C_J		0xa000
+#define FUNCT3_C_JAL		0x2000
+#define FUNCT4_C_JR		0x8000
+#define FUNCT4_C_JALR		0xf000
+
+#define FUNCT12_SRET		0x10200000
+
+#define MATCH_JALR		(FUNCT3_JALR | OPCODE_JALR)
+#define MATCH_JAL		(OPCODE_JAL)
+#define MATCH_BEQ		(FUNCT3_BEQ | OPCODE_BRANCH)
+#define MATCH_BNE		(FUNCT3_BNE | OPCODE_BRANCH)
+#define MATCH_BLT		(FUNCT3_BLT | OPCODE_BRANCH)
+#define MATCH_BGE		(FUNCT3_BGE | OPCODE_BRANCH)
+#define MATCH_BLTU		(FUNCT3_BLTU | OPCODE_BRANCH)
+#define MATCH_BGEU		(FUNCT3_BGEU | OPCODE_BRANCH)
+#define MATCH_SRET		(FUNCT12_SRET | OPCODE_SYSTEM)
+#define MATCH_C_BEQZ		(FUNCT3_C_BEQZ | OPCODE_C_1)
+#define MATCH_C_BNEZ		(FUNCT3_C_BNEZ | OPCODE_C_1)
+#define MATCH_C_J		(FUNCT3_C_J | OPCODE_C_1)
+#define MATCH_C_JAL		(FUNCT3_C_JAL | OPCODE_C_1)
+#define MATCH_C_JR		(FUNCT4_C_JR | OPCODE_C_2)
+#define MATCH_C_JALR		(FUNCT4_C_JALR | OPCODE_C_2)
+
+#define MASK_JALR		0x707f
+#define MASK_JAL		0x7f
+#define MASK_C_JALR		0xf07f
+#define MASK_C_JR		0xf07f
+#define MASK_C_JAL		0xe003
+#define MASK_C_J		0xe003
+#define MASK_BEQ		0x707f
+#define MASK_BNE		0x707f
+#define MASK_BLT		0x707f
+#define MASK_BGE		0x707f
+#define MASK_BLTU		0x707f
+#define MASK_BGEU		0x707f
+#define MASK_C_BEQZ		0xe003
+#define MASK_C_BNEZ		0xe003
+#define MASK_SRET		0xffffffff
+
+#define __INSN_LENGTH_MASK	_UL(0x3)
+#define __INSN_LENGTH_GE_32	_UL(0x3)
+#define __INSN_OPCODE_MASK	_UL(0x7F)
+#define __INSN_BRANCH_OPCODE	_UL(OPCODE_BRANCH)
+
+/* Define a series of is_XXX_insn functions to check if the value INSN
+ * is an instance of instruction XXX.
+ */
+#define DECLARE_INSN(INSN_NAME, INSN_MATCH, INSN_MASK) \
+static inline bool is_ ## INSN_NAME ## _insn(long insn) \
+{ \
+	return (insn & (INSN_MASK)) == (INSN_MATCH); \
+}
+
+#define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
+#define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
+#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
+#define RVC_X(X, s, mask) RV_X(X, s, mask)
+
+#define EXTRACT_JTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, J_IMM_10_1_OPOFF, J_IMM_10_1_MASK) << J_IMM_10_1_OFF) | \
+	(RV_X(x_, J_IMM_11_OPOFF, J_IMM_11_MASK) << J_IMM_11_OFF) | \
+	(RV_X(x_, J_IMM_19_12_OPOFF, J_IMM_19_12_MASK) << J_IMM_19_12_OFF) | \
+	(RV_IMM_SIGN(x_) << J_IMM_SIGN_OFF); })
+
+#define EXTRACT_ITYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, I_IMM_11_0_OPOFF, I_IMM_11_0_MASK)) | \
+	(RV_IMM_SIGN(x_) << I_IMM_SIGN_OFF); })
+
+#define EXTRACT_BTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, B_IMM_4_1_OPOFF, B_IMM_4_1_MASK) << B_IMM_4_1_OFF) | \
+	(RV_X(x_, B_IMM_10_5_OPOFF, B_IMM_10_5_MASK) << B_IMM_10_5_OFF) | \
+	(RV_X(x_, B_IMM_11_OPOFF, B_IMM_11_MASK) << B_IMM_11_OFF) | \
+	(RV_IMM_SIGN(x_) << B_IMM_SIGN_OFF); })
+
+#define EXTRACT_RVC_J_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_J_IMM_3_1_OPOFF, RVC_J_IMM_3_1_MASK) << RVC_J_IMM_3_1_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_4_OPOFF, RVC_J_IMM_4_MASK) << RVC_J_IMM_4_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_5_OPOFF, RVC_J_IMM_5_MASK) << RVC_J_IMM_5_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_6_OPOFF, RVC_J_IMM_6_MASK) << RVC_J_IMM_6_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_7_OPOFF, RVC_J_IMM_7_MASK) << RVC_J_IMM_7_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_9_8_OPOFF, RVC_J_IMM_9_8_MASK) << RVC_J_IMM_9_8_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_10_OPOFF, RVC_J_IMM_10_MASK) << RVC_J_IMM_10_OFF) | \
+	(RVC_IMM_SIGN(x_) << RVC_J_IMM_SIGN_OFF); })
+
+#define EXTRACT_RVC_B_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_B_IMM_2_1_OPOFF, RVC_B_IMM_2_1_MASK) << RVC_B_IMM_2_1_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_4_3_OPOFF, RVC_B_IMM_4_3_MASK) << RVC_B_IMM_4_3_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
+	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 86d891b7ea2c..2debc88f0a8b 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -8,13 +8,168 @@
 #include <linux/string.h>
 #include <asm/cacheflush.h>
 #include <asm/gdb_xml.h>
+#include <asm/parse_asm.h>
 
 enum {
 	NOT_KGDB_BREAK = 0,
 	KGDB_SW_BREAK,
 	KGDB_COMPILED_BREAK,
+	KGDB_SW_SINGLE_STEP
 };
 
+static unsigned long stepped_address;
+static unsigned int stepped_opcode;
+
+#if __riscv_xlen == 32
+/* C.JAL is an RV32C-only instruction */
+DECLARE_INSN(c_jal, MATCH_C_JAL, MASK_C_JAL)
+#else
+#define is_c_jal_insn(opcode) 0
+#endif
+DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
+DECLARE_INSN(jal, MATCH_JAL, MASK_JAL)
+DECLARE_INSN(c_jr, MATCH_C_JR, MASK_C_JR)
+DECLARE_INSN(c_jalr, MATCH_C_JALR, MASK_C_JALR)
+DECLARE_INSN(c_j, MATCH_C_J, MASK_C_J)
+DECLARE_INSN(beq, MATCH_BEQ, MASK_BEQ)
+DECLARE_INSN(bne, MATCH_BNE, MASK_BNE)
+DECLARE_INSN(blt, MATCH_BLT, MASK_BLT)
+DECLARE_INSN(bge, MATCH_BGE, MASK_BGE)
+DECLARE_INSN(bltu, MATCH_BLTU, MASK_BLTU)
+DECLARE_INSN(bgeu, MATCH_BGEU, MASK_BGEU)
+DECLARE_INSN(c_beqz, MATCH_C_BEQZ, MASK_C_BEQZ)
+DECLARE_INSN(c_bnez, MATCH_C_BNEZ, MASK_C_BNEZ)
+DECLARE_INSN(sret, MATCH_SRET, MASK_SRET)
+
+int decode_register_index(unsigned long opcode, int offset)
+{
+	return (opcode >> offset) & 0x1F;
+}
+
+int decode_register_index_short(unsigned long opcode, int offset)
+{
+	return ((opcode >> offset) & 0x7) + 8;
+}
+
+/* Calculate the new address for after a step */
+int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
+{
+	unsigned long pc = regs->epc;
+	unsigned long *regs_ptr = (unsigned long *)regs;
+	unsigned int rs1_num, rs2_num;
+	int op_code;
+
+	if (probe_kernel_address((void *)pc, op_code))
+		return -EINVAL;
+	if ((op_code & __INSN_LENGTH_MASK) != __INSN_LENGTH_GE_32) {
+		if (is_c_jalr_insn(op_code) || is_c_jr_insn(op_code)) {
+			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
+			*next_addr = regs_ptr[rs1_num];
+		} else if (is_c_j_insn(op_code) || is_c_jal_insn(op_code)) {
+			*next_addr = EXTRACT_RVC_J_IMM(op_code) + pc;
+		} else if (is_c_beqz_insn(op_code)) {
+			rs1_num = decode_register_index_short(op_code,
+							      RVC_C1_RS1_OPOFF);
+			if (!rs1_num || regs_ptr[rs1_num] == 0)
+				*next_addr = EXTRACT_RVC_B_IMM(op_code) + pc;
+			else
+				*next_addr = pc + 2;
+		} else if (is_c_bnez_insn(op_code)) {
+			rs1_num =
+			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
+			if (rs1_num && regs_ptr[rs1_num] != 0)
+				*next_addr = EXTRACT_RVC_B_IMM(op_code) + pc;
+			else
+				*next_addr = pc + 2;
+		} else {
+			*next_addr = pc + 2;
+		}
+	} else {
+		if ((op_code & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE) {
+			bool result = false;
+			long imm = EXTRACT_BTYPE_IMM(op_code);
+			unsigned long rs1_val = 0, rs2_val = 0;
+
+			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
+			rs2_num = decode_register_index(op_code, RVG_RS2_OPOFF);
+			if (rs1_num)
+				rs1_val = regs_ptr[rs1_num];
+			if (rs2_num)
+				rs2_val = regs_ptr[rs2_num];
+
+			if (is_beq_insn(op_code))
+				result = (rs1_val == rs2_val) ? true : false;
+			else if (is_bne_insn(op_code))
+				result = (rs1_val != rs2_val) ? true : false;
+			else if (is_blt_insn(op_code))
+				result =
+				    ((long)rs1_val <
+				     (long)rs2_val) ? true : false;
+			else if (is_bge_insn(op_code))
+				result =
+				    ((long)rs1_val >=
+				     (long)rs2_val) ? true : false;
+			else if (is_bltu_insn(op_code))
+				result = (rs1_val < rs2_val) ? true : false;
+			else if (is_bgeu_insn(op_code))
+				result = (rs1_val >= rs2_val) ? true : false;
+			if (result)
+				*next_addr = imm + pc;
+			else
+				*next_addr = pc + 4;
+		} else if (is_jal_insn(op_code)) {
+			*next_addr = EXTRACT_JTYPE_IMM(op_code) + pc;
+		} else if (is_jalr_insn(op_code)) {
+			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
+			if (rs1_num)
+				*next_addr = ((unsigned long *)regs)[rs1_num];
+			*next_addr += EXTRACT_ITYPE_IMM(op_code);
+		} else if (is_sret_insn(op_code)) {
+			*next_addr = pc;
+		} else {
+			*next_addr = pc + 4;
+		}
+	}
+	return 0;
+}
+
+int do_single_step(struct pt_regs *regs)
+{
+	/* Determine where the target instruction will send us to */
+	unsigned long addr = 0;
+	int error = get_step_address(regs, &addr);
+
+	if (error)
+		return error;
+
+	stepped_address = addr;
+
+	/* Store the op code in the stepped address */
+	probe_kernel_address((void *)addr, stepped_opcode);
+	/* Replace the op code with the break instruction */
+	error = probe_kernel_write((void *)addr,
+				   arch_kgdb_ops.gdb_bpt_instr,
+				   BREAK_INSTR_SIZE);
+	/* Flush and return */
+	if (!error)
+		flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
+
+	return error;
+}
+
+/* Undo a single step */
+static void undo_single_step(struct pt_regs *regs)
+{
+	if (stepped_opcode != 0) {
+		probe_kernel_write((void *)stepped_address,
+				   (void *)&stepped_opcode, BREAK_INSTR_SIZE);
+		flush_icache_range(stepped_address,
+				   stepped_address + BREAK_INSTR_SIZE);
+	}
+	stepped_address = 0;
+	stepped_opcode = 0;
+}
+
 struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	{DBG_REG_ZERO, GDB_SIZEOF_REG, -1},
 	{DBG_REG_RA, GDB_SIZEOF_REG, offsetof(struct pt_regs, ra)},
@@ -131,6 +286,8 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 {
 	int err = 0;
 
+	undo_single_step(regs);
+
 	switch (remcom_in_buffer[0]) {
 	case 'c':
 	case 'D':
@@ -140,6 +297,15 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 		atomic_set(&kgdb_cpu_doing_single_step, -1);
 		kgdb_single_step = 0;
 		break;
+	case 's':
+		kgdb_arch_update_addr(regs, remcom_in_buffer);
+		err = do_single_step(regs);
+		if (!err) {
+			kgdb_single_step = 1;
+			atomic_set(&kgdb_cpu_doing_single_step,
+				   raw_smp_processor_id());
+		}
+		break;
 	default:
 		err = -1;
 	}
@@ -149,6 +315,8 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 
 int kgdb_riscv_kgdbbreak(unsigned long addr)
 {
+	if (stepped_address == addr)
+		return KGDB_SW_SINGLE_STEP;
 	if (atomic_read(&kgdb_setting_breakpoint))
 		if (addr == (unsigned long)&kgdb_compiled_break)
 			return KGDB_COMPILED_BREAK;
@@ -172,7 +340,8 @@ static int kgdb_riscv_notify(struct notifier_block *self, unsigned long cmd,
 		return NOTIFY_DONE;
 
 	local_irq_save(flags);
-	if (kgdb_handle_exception(1, args->signr, cmd, regs))
+	if (kgdb_handle_exception(type == KGDB_SW_SINGLE_STEP ? 0 : 1,
+				  args->signr, cmd, regs))
 		return NOTIFY_DONE;
 
 	if (type == KGDB_COMPILED_BREAK)
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
