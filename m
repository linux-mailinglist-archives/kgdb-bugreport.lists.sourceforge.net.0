Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B001B32FE
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 22 Apr 2020 01:19:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jR2AR-0003Uc-Gs
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Apr 2020 23:19:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jR2AO-0003UH-HO
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 23:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xUcGflZnFhOd0jedtjOYb8d/IvgXOcGwD+FKfMvLsuQ=; b=RLvX36lnAldpJoKfueeew+XMqd
 hSno4lgM23yvhKZgg3gJQX5kmhx8WJ6gu+zMqPD2A9DX5PrejoBNNiJwXAYCpx7VmrySNn8rBwEk9
 XwWPDTQ70HlM+6xjgQN30DZ9NdKVkFwwNvI0zlqKIiZ2cEKN3MxG3ENkp6Yjb85LTEZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:CC
 :In-Reply-To:Subject:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xUcGflZnFhOd0jedtjOYb8d/IvgXOcGwD+FKfMvLsuQ=; b=B
 Xt7Tshly7ZcM7BkcZzRIc2N2meLqpCUeV7NPcfcYUZhxIzRTVWWwGeGfRN5d56+vbQ1OltLmW+vb5
 jeLfV6Lh94Qfqsw8Rq6n8ZWDJSecA4nq8T+9y8Gu7476Dd7emoVFYbeZbaVQ9mWgZaPdrToMtdZg/
 e9xLAHCUcrN/nj/c=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jR2AJ-008yiY-EO
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 23:19:00 +0000
Received: by mail-il1-f194.google.com with SMTP id r2so72992ilo.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2020 16:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xUcGflZnFhOd0jedtjOYb8d/IvgXOcGwD+FKfMvLsuQ=;
 b=LBNZ6G+duzTlZvHlVNg6/+b5dK8K0HRiXD/rroodAjqaQ07GL3q50XBMniSMSrLhY7
 acZPFwVGSdoAnazeckdFUM1p6DMqVmhnnyJEEqflIJ/Tb0QhwTNuK8LICBqXNnFy5Yt/
 2d3hzttUrpX1tnESmiMeT0JxMLOoGzyPMcCyNTaHJzjvRS5sEfwczZ6AyggeFL7Nyv+M
 1G2mA+Qza9mCVTKhWOG4qf4z7Bt0eG3wVN0W2y6NBkMf5YUPiihz18MD6rEh/rhy98e4
 Yqng62BYDLSaOiBxkOophc9zmKeBwLoTVBC9dKR7uIndS3VyybXAjGsSppbdzFiECeM3
 2qsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xUcGflZnFhOd0jedtjOYb8d/IvgXOcGwD+FKfMvLsuQ=;
 b=V6DwRlQjXYCxdmcimF0O/b32b0OMntQ0LfXD9BvNh9HMPEH4NSXus1jTe9u1YeoVhL
 Zffy/NaIiJd25k1VQT01VFoNxGoQrDyFtDv3rdvoSBe6kdDUPw5b3cMZwD3gr0+jNysw
 pWeJDapveyv7z9PZu+qN+4Y+ze65aEGrfw4LGMhoimW550CeajmoYTJYrwOsGFm/mBAE
 CNZLhxZ7mFMhU86ERwR1kCzRNu9YSarqYMYUZTde/qUzAgoWBDAeiWNfsB16pKHmXxJN
 pXqP78wd1UnOPL7i3bmdLdjN28Vf273PON88JirNP0/JDOK35U4iW591XhStrGi5UIG6
 6+6A==
X-Gm-Message-State: AGi0PuaNJgEtsMjyzViI5fmu6tjoU4RbkqjTCnE+MJkSepEyz0ks/HbN
 9+F8ciXN96EjAn2op0jkJ7Nh6vsLaRPGbw==
X-Google-Smtp-Source: APiQypKfTnofrbXBc73JUBXNpJyqxRKBHickk8xxxBcTwx0xJPLlcaiORNh1G9W4AuvYudGgKYyatw==
X-Received: by 2002:a63:210:: with SMTP id 16mr7215591pgc.423.1587510653075;
 Tue, 21 Apr 2020 16:10:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z5sm315104pfn.142.2020.04.21.16.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 16:10:52 -0700 (PDT)
Date: Tue, 21 Apr 2020 16:10:52 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Apr 2020 15:32:15 PDT (-0700)
In-Reply-To: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-93af96a6-42bf-4f06-afc5-e053e71e98e6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jR2AJ-008yiY-EO
Subject: Re: [Kgdb-bugreport] [PATCH v4 0/5] Add KGDB and KDB support
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
Cc: kgdb-bugreport@lists.sourceforge.net, daniel.thompson@linaro.org,
 vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 15 Apr 2020 19:38:03 PDT (-0700), vincent.chen@sifive.com wrote:
> This patch set implements required ports to enable RISC-V kernel to support
> KGDB and KDB features. Because there is no immediate value in the RISC-V
> trap instruction, the kernel cannot identify the purpose of each trap
> exception through the opcode. This makes the existing identification
> schemes in other architecture unsuitable for the RISC-V kernel. In order
> to solve this problem, this patch adds the kgdb_has_hit_break() to kgdb.c
> to help the RISC-V kernel identify the KGDB trap exception. In addition,
> the XML target description was introduced in this patch set to enable KGDB
> to report the contents of the $status, $cause and $badaddr registers.
>
> This patchset has passed the kgdbts test suite provided by Linux kernel on
> HiFive unleashed board and QEMU.
>
> Changes since v3:
> 1. remove duplicate macro defition
> 2. Rename CONFIG_ARCH_SUPPORTS_GDB_XML to CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
>    in the description of patch 03/05.
>
> Changes since v2:
> 1. Fix typos
> 2. Rename CONFIG_ARCH_SUPPORTS_GDB_XML to CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
> 3. Add the prefix kgdb_ to the handler functions and arrays that handle
>    "qxfer" packets
>
> Changes since v1:
> 1. Replace the magic number with macro when filling the gdb_regs[].
> 2. Only support GDB XML packet instead of all query packets.
> 3. Move the macros used to parse instructions to parse_asm.h
>
> Vincent Chen (5):
>   kgdb: Add kgdb_has_hit_break function
>   riscv: Add KGDB support
>   kgdb: enable arch to support XML packet support.
>   riscv: Use the XML target descriptions to report 3 system registers
>   riscv: Add SW single-step support for KDB
>
>  arch/riscv/Kconfig                 |   2 +
>  arch/riscv/include/asm/gdb_xml.h   | 117 +++++++++++
>  arch/riscv/include/asm/kdebug.h    |  12 ++
>  arch/riscv/include/asm/kgdb.h      | 112 +++++++++++
>  arch/riscv/include/asm/parse_asm.h | 219 +++++++++++++++++++++
>  arch/riscv/kernel/Makefile         |   1 +
>  arch/riscv/kernel/kgdb.c           | 390 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/traps.c          |   5 +
>  include/linux/kgdb.h               |  11 ++
>  kernel/debug/debug_core.c          |  12 ++
>  kernel/debug/gdbstub.c             |  13 ++
>  lib/Kconfig.kgdb                   |   5 +
>  12 files changed, 899 insertions(+)
>  create mode 100644 arch/riscv/include/asm/gdb_xml.h
>  create mode 100644 arch/riscv/include/asm/kdebug.h
>  create mode 100644 arch/riscv/include/asm/kgdb.h
>  create mode 100644 arch/riscv/include/asm/parse_asm.h
>  create mode 100644 arch/riscv/kernel/kgdb.c

Thanks, I'm taking this into for-next.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
