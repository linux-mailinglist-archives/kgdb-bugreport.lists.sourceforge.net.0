Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D61B0748
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Apr 2020 13:22:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jQUVf-0004jA-0L
	for lists+kgdb-bugreport@lfdr.de; Mon, 20 Apr 2020 11:22:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jPANa-0007TV-PV
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 19:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8isCzhDtgEMidCzVcVcieXb42R1qlOmhDYjuQQ4xGPM=; b=inSc1KJfUYU8kSx+qbDHb+S+vx
 rVOz3RI735me7AiexR5qeU1hGfrDe8Ab6sWqUzwL82FGVnze9egRzZU5W23RSkamvXCGx4isapJhV
 8xY+9Zf8Nzcmoqg5OWjlPyAHMPu+F1AIoISWzgKr43Qs4kiSd8uc4GX/egEOOyvQ6BeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:CC
 :In-Reply-To:Subject:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8isCzhDtgEMidCzVcVcieXb42R1qlOmhDYjuQQ4xGPM=; b=g
 geLEKmzvWYQN0gyieALnR/Qjx05HdBaM13PkNTDldFUBLG9rSYrlGf1H84u38y9RO4Q6nbThWYgsg
 kKibdgmQKeOPK7ydocvhRHU0xpvqS4/UA4zEGuUGWIWr+pZA49gAxANPAIiCk6QfYrhY0y86Q1a2e
 4Wl9kG9v39gAAU2k=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jPANT-000Vqs-UP
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 19:40:54 +0000
Received: by mail-oi1-f193.google.com with SMTP id t199so4176oif.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Apr 2020 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8isCzhDtgEMidCzVcVcieXb42R1qlOmhDYjuQQ4xGPM=;
 b=gci/aD/YroS0ZeGRF0CR4C8D3NixO9qofN/7pQ0Hwk1sYzVKLnPPXUnblD1Gpc+IM7
 aRqV8V/jxqlY1f+Hvz62yBfaYBQRA4GQlKjTLFmPQC7lZdDHCAHbBSnMDSioJ8/yDmze
 HGlZ2RhDIeRaWzGWwsVqRT51rFwFWONvy+zqgJt1QZwMc9GgZ8YgaGaOBiLVjekm4Ihe
 5wUXwTJ7xdE5c0ScC3DKp4F6Kh312vj6xIIigqdhtc4o+yx17OcvLdz/wNTiaydh/hm4
 fEHtM8xgoREyDuTQzGO9ChdNZY7TU9yl0xA+k5uQi6wFEUOdjHzEPp7Rd41A5p13gQh7
 JTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8isCzhDtgEMidCzVcVcieXb42R1qlOmhDYjuQQ4xGPM=;
 b=raRTyUyyneA8CfFkd1LVobEiKl/lN7B7Ze2zhu89bPkWITl2PRyD6AQcG4+S2BHgzn
 z912533Gn9IXgDv4x8yscxxxzjFQyeBE3jDM+UzqmXFzPQHWuG4sGtM6rJ25X1aTe1Jd
 L7QdC2g7Pgk1gy0YrvZIGWHga8gzdhLI/73tHLHkKV9nbhs34G1rEZTbDNRg5qmXqrov
 OWUekscv0nxgEZR5GnpkPgKcUqcg6CqWgcQr/XCQB2+SOBgCB8G6/IrOVSixdXN/ITWn
 ulX2iTgCeTccB6D12v1bqf9Afcifw2vFeQAggRB1ukS89+xhFbckWdg2R+yhCS1jmZP3
 DJ2w==
X-Gm-Message-State: AGi0PuZaRJKthqcXYZ2lCU22sa8ZqeXo4gD1Hvzp+wg7wl28h9Lgjz3P
 tRcStKQYP+S3eVl9VfasNsgmox3Gi2bOrQ==
X-Google-Smtp-Source: APiQypLkajFbxmO74SIGOJP5GgpNv+oAo4IL/RxeIXMWZ+KLOdF+0TR06Z2B66kakx2ZbQ/9Yi+6+A==
X-Received: by 2002:a17:90a:2004:: with SMTP id
 n4mr7008446pjc.190.1587064331839; 
 Thu, 16 Apr 2020 12:12:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q97sm3505687pjb.7.2020.04.16.12.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 12:12:11 -0700 (PDT)
Date: Thu, 16 Apr 2020 12:12:11 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Apr 2020 12:12:08 PDT (-0700)
In-Reply-To: <1585668191-16287-5-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-062ce9f5-ddff-43e4-8fc9-1ebaeead969c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jPANT-000Vqs-UP
X-Mailman-Approved-At: Mon, 20 Apr 2020 11:22:39 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/5] riscv: Use the XML target
 descriptions to report 3 system registers
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, vincent.chen@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 31 Mar 2020 08:23:10 PDT (-0700), vincent.chen@sifive.com wrote:
> The $sstatus, $badaddr, and $scause registers belong to the thread context,
> so KGDB can obtain their contents from pt_regs in each trap. However, the
> sequential number of these registers in the gdb register list is far from
> the general-purpose registers. If riscv port uses the existing method to
> report these three registers, many trivial registers with sequence numbers
> in the middle of them will also be packaged to the reply packets. To solve
> this problem, the riscv port wants to introduce the GDB target description
> mechanism to customize the reported register list. By the list, the KGDB
> can ignore the intermediate registers and just reports the general-purpose
> registers and these three system registers.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/Kconfig               |   1 +
>  arch/riscv/include/asm/gdb_xml.h | 117 +++++++++++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/kgdb.h    |   8 ++-
>  arch/riscv/kernel/kgdb.c         |  14 +++++
>  4 files changed, 139 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/gdb_xml.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 108794f4aa45..94b6f301007c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -67,6 +67,7 @@ config RISCV
>  	select HAVE_COPY_THREAD_TLS
>  	select HAVE_ARCH_KASAN if MMU && 64BIT
>  	select HAVE_ARCH_KGDB
> +	select ARCH_SUPPORTS_GDB_XML
>
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT
> diff --git a/arch/riscv/include/asm/gdb_xml.h b/arch/riscv/include/asm/gdb_xml.h
> new file mode 100644
> index 000000000000..1d1459d06a1b
> --- /dev/null
> +++ b/arch/riscv/include/asm/gdb_xml.h
> @@ -0,0 +1,117 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_GDB_XML_H_
> +#define __ASM_GDB_XML_H_
> +
> +#define arch_gdb_stub_feature riscv_gdb_stub_feature
> +static const char riscv_gdb_stub_feature[64] =
> +			"PacketSize=800;qXfer:features:read+;";
> +
> +static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
> +
> +#ifdef CONFIG_64BIT
> +static const char gdb_xfer_read_cpuxml[39] =
> +			"qXfer:features:read:riscv-64bit-cpu.xml";
> +
> +static const char riscv_gdb_stub_target_desc[256] =
> +"l<?xml version=\"1.0\"?>"
> +"<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
> +"<target>"
> +"<xi:include href=\"riscv-64bit-cpu.xml\"/>"
> +"</target>";
> +
> +static const char riscv_gdb_stub_cpuxml[2048] =
> +"l<?xml version=\"1.0\"?>"
> +"<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
> +"<feature name=\"org.gnu.gdb.riscv.cpu\">"
> +"<reg name=\""DBG_REG_ZERO"\" bitsize=\"64\" type=\"int\" regnum=\"0\"/>"
> +"<reg name=\""DBG_REG_RA"\" bitsize=\"64\" type=\"code_ptr\"/>"
> +"<reg name=\""DBG_REG_SP"\" bitsize=\"64\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_GP"\" bitsize=\"64\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_TP"\" bitsize=\"64\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_T0"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T1"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T2"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_FP"\" bitsize=\"64\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_S1"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A0"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A1"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A2"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A3"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A4"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A5"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A6"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A7"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S2"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S3"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S4"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S5"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S6"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S7"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S8"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S9"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S10"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S11"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T3"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T4"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T5"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T6"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_EPC"\" bitsize=\"64\" type=\"code_ptr\"/>"
> +"<reg name=\""DBG_REG_STATUS"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_BADADDR"\" bitsize=\"64\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_CAUSE"\" bitsize=\"64\" type=\"int\"/>"
> +"</feature>";
> +#else
> +static const char gdb_xfer_read_cpuxml[39] =
> +			"qXfer:features:read:riscv-32bit-cpu.xml";
> +
> +static const char riscv_gdb_stub_target_desc[256] =
> +"l<?xml version=\"1.0\"?>"
> +"<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
> +"<target>"
> +"<xi:include href=\"riscv-32bit-cpu.xml\"/>"
> +"</target>";
> +
> +static const char riscv_gdb_stub_cpuxml[2048] =
> +"l<?xml version=\"1.0\"?>"
> +"<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
> +"<feature name=\"org.gnu.gdb.riscv.cpu\">"
> +"<reg name=\""DBG_REG_ZERO"\" bitsize=\"32\" type=\"int\" regnum=\"0\"/>"
> +"<reg name=\""DBG_REG_RA"\" bitsize=\"32\" type=\"code_ptr\"/>"
> +"<reg name=\""DBG_REG_SP"\" bitsize=\"32\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_GP"\" bitsize=\"32\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_TP"\" bitsize=\"32\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_T0"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T1"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T2"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_FP"\" bitsize=\"32\" type=\"data_ptr\"/>"
> +"<reg name=\""DBG_REG_S1"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A0"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A1"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A2"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A3"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A4"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A5"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A6"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_A7"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S2"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S3"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S4"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S5"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S6"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S7"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S8"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S9"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S10"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_S11"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T3"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T4"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T5"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_T6"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_EPC"\" bitsize=\"32\" type=\"code_ptr\"/>"
> +"<reg name=\""DBG_REG_STATUS"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_BADADDR"\" bitsize=\"32\" type=\"int\"/>"
> +"<reg name=\""DBG_REG_CAUSE"\" bitsize=\"32\" type=\"int\"/>"
> +"</feature>";
> +#endif
> +#endif
> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> index 69bc6a03081d..6c35a853940d 100644
> --- a/arch/riscv/include/asm/kgdb.h
> +++ b/arch/riscv/include/asm/kgdb.h
> @@ -7,7 +7,7 @@
>
>  #define GDB_SIZEOF_REG sizeof(unsigned long)
>
> -#define DBG_MAX_REG_NUM (33)
> +#define DBG_MAX_REG_NUM (36)
>  #define NUMREGBYTES ((DBG_MAX_REG_NUM) * GDB_SIZEOF_REG)
>  #define CACHE_FLUSH_IS_SAFE     1
>  #define BUFMAX                  2048
> @@ -66,6 +66,9 @@ static inline void arch_kgdb_breakpoint(void)
>  #define DBG_REG_T5 "t5"
>  #define DBG_REG_T6 "t6"
>  #define DBG_REG_EPC "pc"
> +#define DBG_REG_STATUS "sstatus"
> +#define DBG_REG_BADADDR "stval"
> +#define DBG_REG_CAUSE "scause"
>
>  #define DBG_REG_ZERO_OFF 0
>  #define DBG_REG_RA_OFF 1
> @@ -103,5 +106,8 @@ static inline void arch_kgdb_breakpoint(void)
>  #define DBG_REG_STATUS_OFF 33
>  #define DBG_REG_BADADDR_OFF 34
>  #define DBG_REG_CAUSE_OFF 35
> +
> +#include <asm/gdb_xml.h>
> +
>  #endif
>  #endif
> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
> index e3b1075c3935..86d891b7ea2c 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -7,6 +7,7 @@
>  #include <linux/irqflags.h>
>  #include <linux/string.h>
>  #include <asm/cacheflush.h>
> +#include <asm/gdb_xml.h>
>
>  enum {
>  	NOT_KGDB_BREAK = 0,
> @@ -48,6 +49,9 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
>  	{DBG_REG_T5, GDB_SIZEOF_REG, offsetof(struct pt_regs, t5)},
>  	{DBG_REG_T6, GDB_SIZEOF_REG, offsetof(struct pt_regs, t6)},
>  	{DBG_REG_EPC, GDB_SIZEOF_REG, offsetof(struct pt_regs, epc)},
> +	{DBG_REG_STATUS, GDB_SIZEOF_REG, offsetof(struct pt_regs, status)},
> +	{DBG_REG_BADADDR, GDB_SIZEOF_REG, offsetof(struct pt_regs, badaddr)},
> +	{DBG_REG_CAUSE, GDB_SIZEOF_REG, offsetof(struct pt_regs, cause)},
>  };
>
>  char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
> @@ -100,6 +104,16 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>  	regs->epc = pc;
>  }
>
> +void arch_handle_qxfer_pkt(char *remcom_in_buffer, char *remcom_out_buffer)
> +{
> +	if (!strncmp(remcom_in_buffer, gdb_xfer_read_target,
> +		     sizeof(gdb_xfer_read_target)))
> +		strcpy(remcom_out_buffer, riscv_gdb_stub_target_desc);
> +	else if (!strncmp(remcom_in_buffer, gdb_xfer_read_cpuxml,
> +			  sizeof(gdb_xfer_read_cpuxml)))
> +		strcpy(remcom_out_buffer, riscv_gdb_stub_cpuxml);
> +}
> +
>  static inline void kgdb_arch_update_addr(struct pt_regs *regs,
>  					 char *remcom_in_buffer)
>  {

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
