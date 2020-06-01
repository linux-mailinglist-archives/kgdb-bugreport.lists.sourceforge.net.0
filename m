Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEF1E9C5C
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 06:07:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfbjf-0004BD-6y
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 04:07:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jfbjd-0004Az-WB
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBcH4K6Px6Md6M1RB2I82gPLFIe6OcV4vDVmjUMJakE=; b=L+x3wwvFmKRD3WZuhVzd0x9OnX
 8RO6JI8+rPk9SPYEsLEypquDRYyLDlm/VA3JYCyD77vXnE0AiP8jjQ7vljtZnVx3iTz0rMY1OqnDQ
 JKP201iTbAH3sg9nHMQBQqy3gqrplqU8iPuPJgs9Pl1Nt2z6oD1zjMLHb9sAbDspwBUU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fBcH4K6Px6Md6M1RB2I82gPLFIe6OcV4vDVmjUMJakE=; b=UpS27DNJkg9jhru/4zMe4CI/FN
 ntMHBgM4x0shRX6ij8Y757Z8IIvxsIcyIx1YO7bCOROJYDd8AwFQ3KDXmsKfVdoJkSkVGFiR3DgAO
 Ynsj2nhxz/kn/l0mz3VeCqA5qcD0qq1x35HFHUL/NiZSJ2gCaRxIvyMMFISoG9XaJhfc=;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfbjb-005oYt-Tv
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:07:37 +0000
Received: by mail-oi1-f176.google.com with SMTP id d67so2898420oig.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 31 May 2020 21:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fBcH4K6Px6Md6M1RB2I82gPLFIe6OcV4vDVmjUMJakE=;
 b=MTRZu5DnknmFVMR98zWsnbT+WM1cRjsNNsNflGpHkkj3KMiPNgb+XfUiIC4iPClUWI
 IYeWW5BrgJ0mUzNVD+oc/D7v3TvwBT/MNJJBQUyuiPrSp4HQQWRAG9VtKtm1TZ0rOZt3
 DhS50HtJkEr2das1bthMn/FHrdhggiK+pwHOkdslh8txw2Wb4g2tytMnH4F7wVrzMkTT
 lNquo8umt27IV+W+HTC+ZFVbB+AQEzesnWZvJQM3XWE/tnRtUInQb+NHHeHdt7eJ4JXq
 +wE6cv28OFOL3oH49ybkzPfhwzW6vhGAKJkUaUY88L/mlCWagsHOSU9XMGCRJ8r0OPvE
 QPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fBcH4K6Px6Md6M1RB2I82gPLFIe6OcV4vDVmjUMJakE=;
 b=p6b9HoWbUJQiFbzfDj4o3o7GI4kJ0zbgnG1VNxK5xZPYubZHvgVyddUNeDJH80bpmu
 J16WM1CkenDAI2LaU62poUBbCjl0JM+r2/N2MqZTVqrgKJVFIhlrXWLw9QC82w2jCDKi
 VCouK5Q1DGJF5X2HGj3PMNxnHXJDBgbxgfWsgbcwiNkGneaCP4eoDuoVUQIE3Q2XN10t
 x9+Yc4QGko0u9yKx+vBjl8y+oaNf+neIxRp/rVtj2WnBj4fxGUXpqS35oEWDnpv872pE
 O2ncTEEwwRscxYWH7KHyT8PO5csLmuuSsFNXPSVg9WKCHjV5fxQjULRqepxihlmMnMuh
 3B7Q==
X-Gm-Message-State: AOAM530E8xroSXTygwsVbjKlD/SmSVaBrpvl41/CWBx+HiEpfIlr6bsM
 wIFPS0B/9tMZsf9+usD1Y7O5qKCUsgo=
X-Google-Smtp-Source: ABdhPJzSHVOcfJWuG2m4r9DrKx3VIsEG+j+W5KD00aCmSGz80HIoiwHyTMcLsYQgDFmudt3XxDiwTQ==
X-Received: by 2002:a17:90a:dc16:: with SMTP id
 i22mr4724340pjv.84.1590982808056; 
 Sun, 31 May 2020 20:40:08 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (2001-b400-e3df-96c7-30f0-f751-b645-f4e3.emome-ip6.hinet.net.
 [2001:b400:e3df:96c7:30f0:f751:b645:f4e3])
 by smtp.gmail.com with ESMTPSA id a7sm13102527pfa.187.2020.05.31.20.40.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 20:40:07 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Mon,  1 Jun 2020 11:39:11 +0800
Message-Id: <1590982751-13401-7-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
References: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.176 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 DRUGS_ERECTILE_OBFU    Obfuscated reference to an erectile drug
 2.2 DRUGS_ERECTILE         Refers to an erectile drug
 -1.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfbjb-005oYt-Tv
Subject: [Kgdb-bugreport] [V5 patch 6/6] riscv: Add SW single-step support
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/parse_asm.h | 219 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/kgdb.c           | 179 +++++++++++++++++++++++++++++-
 2 files changed, 397 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/parse_asm.h

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
new file mode 100644
index 000000000000..f36368de839f
--- /dev/null
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
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
+#define J_IMM_19_12_OFF		12
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
index 3b7276cadbe3..9d631c9de493 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -11,13 +11,180 @@
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
+static int decode_register_index(unsigned long opcode, int offset)
+{
+	return (opcode >> offset) & 0x1F;
+}
+
+static int decode_register_index_short(unsigned long opcode, int offset)
+{
+	return ((opcode >> offset) & 0x7) + 8;
+}
+
+/* Calculate the new address for after a step */
+static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
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
+			rs1_num =
+			 decode_register_index(op_code, RVC_C2_RS1_OPOFF);
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
+			 decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
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
+static int do_single_step(struct pt_regs *regs)
+{
+	/* Determine where the target instruction will send us to */
+	unsigned long addr = 0;
+	int error = get_step_address(regs, &addr);
+
+	if (error)
+		return error;
+
+	/* Store the op code in the stepped address */
+	error = probe_kernel_address((void *)addr, stepped_opcode);
+	if (error)
+		return error;
+
+	stepped_address = addr;
+
+	/* Replace the op code with the break instruction */
+	error = probe_kernel_write((void *)stepped_address,
+				   arch_kgdb_ops.gdb_bpt_instr,
+				   BREAK_INSTR_SIZE);
+	/* Flush and return */
+	if (!error) {
+		flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
+		kgdb_single_step = 1;
+		atomic_set(&kgdb_cpu_doing_single_step,
+			   raw_smp_processor_id());
+	} else {
+		stepped_address = 0;
+		stepped_opcode = 0;
+	}
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
+	kgdb_single_step = 0;
+	atomic_set(&kgdb_cpu_doing_single_step, -1);
+}
+
 struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	{DBG_REG_ZERO, GDB_SIZEOF_REG, -1},
 	{DBG_REG_RA, GDB_SIZEOF_REG, offsetof(struct pt_regs, ra)},
@@ -135,6 +302,8 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 {
 	int err = 0;
 
+	undo_single_step(regs);
+
 	switch (remcom_in_buffer[0]) {
 	case 'c':
 	case 'D':
@@ -142,6 +311,10 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 		if (remcom_in_buffer[0] == 'c')
 			kgdb_arch_update_addr(regs, remcom_in_buffer);
 		break;
+	case 's':
+		kgdb_arch_update_addr(regs, remcom_in_buffer);
+		err = do_single_step(regs);
+		break;
 	default:
 		err = -1;
 	}
@@ -151,6 +324,8 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 
 static int kgdb_riscv_kgdbbreak(unsigned long addr)
 {
+	if (stepped_address == addr)
+		return KGDB_SW_SINGLE_STEP;
 	if (atomic_read(&kgdb_setting_breakpoint))
 		if (addr == (unsigned long)&kgdb_compiled_break)
 			return KGDB_COMPILED_BREAK;
@@ -174,7 +349,9 @@ static int kgdb_riscv_notify(struct notifier_block *self, unsigned long cmd,
 		return NOTIFY_DONE;
 
 	local_irq_save(flags);
-	if (kgdb_handle_exception(1, args->signr, cmd, regs))
+
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
