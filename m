Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CD1B074B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Apr 2020 13:22:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jQUVf-0004jS-1o
	for lists+kgdb-bugreport@lfdr.de; Mon, 20 Apr 2020 11:22:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jPAQu-0007cJ-9F
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 19:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BMVc0Nq1CQqKNSuSon2QaWhNSUBfgWE8i+bigV69U0w=; b=jkbxtlqp6mFWhnBXdphG8O24BR
 XbLcst9wcbYRhQcXmpCweqNdpZ/8o6QkzTFvvq38UcHXHO0pWd8eCYXxmdWdybZ4eRSZJftl/2YvB
 cThuFJ0por+DTnvzmGfrAb3q2HnZWpdyE+BWQBZVt2zxbDKnokF4YTT8rfYkiHe7C4Vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:CC
 :In-Reply-To:Subject:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BMVc0Nq1CQqKNSuSon2QaWhNSUBfgWE8i+bigV69U0w=; b=n
 SFufILYwLMvN24o2fl3IGp4Cm1R7RK+Ni4D9qXrCM2HAHH5MbJw51zAnc5gxAfKc4TW/4Ts8XUQ0i
 nS6J3KcBeNFoBWCR9vEYpJvRq5nM43BHQhaK46uffeX8q9sGJwugpt3uDYST1tXgN/GWNxJC1JOyK
 fYuk14Fqh4YPXEi4=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jPAQr-000VxE-5b
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 19:44:20 +0000
Received: by mail-oi1-f194.google.com with SMTP id 8so18043oiy.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Apr 2020 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BMVc0Nq1CQqKNSuSon2QaWhNSUBfgWE8i+bigV69U0w=;
 b=Qjhofn3EGGsB6uk9jWUCQo7KeDI4d6lB+wODxHKf0Emz2gw8aMLzQ2Cnv0E19z9bcE
 3waT7ic7zcR1SjHuE8F9tzw60RTa4vt0UvKkPhzXGTHepovNKmk10jn9IQ+DfkyFihLc
 UjxmuPWTwWNQOr9tr4pUi8uPc0RAAOLvFOEJLMVGqvZiQM/n4UnTDFmWYA2aZUs+DRCr
 u3G83kXW4a8AO34l4lyb1Hn6OV14TStiByTDtrrKlhdGpZZnc5K9aRNKwtyCHA1nevxT
 uwuO6GPw69L3IOfvUgKteN5vp8ICgUcSunA84dsydVAyMqPDn9yxmsJ3YUgGKQTHGXde
 jblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BMVc0Nq1CQqKNSuSon2QaWhNSUBfgWE8i+bigV69U0w=;
 b=UJevkBcZh5jKQZIkSMyA7gMTcLBS75FcBXE4Y77bnSAtRKs/lv9A3U0MdWaapEzO7t
 DRWDGNnGJ0bNcttOI1uUAr6J6TfDmke+BRWr9FuBuOKsMP6KZ8I7gGDKa3dGyqNy3w6O
 9tL7d/5gY6eMCVe7yP9f6qsnIqFJLupnY4qQE5qUa1uLPCTB9e4RBYeDoofx/lY00btW
 0KP7oguElLyO96NSlzGIC+jMI2d7FCqk9cOHVpM+dZz6kR9g8muAji6y2eRzALzMWxUx
 P5camJVzTvSIxNuXDP5uw/sNS00WhZ3Eh7VvvUUXXg/Z6QunzSRIezfHtHwz8w/mEkF7
 tKDA==
X-Gm-Message-State: AGi0PuY/Nvai9K1qwrZFomcvLgGr6NwKSzzmoDynsQk7x7wyaevs4QeK
 mKGU4MH8RYYy3igwh3/Ix/5fiZiQZzZMng==
X-Google-Smtp-Source: APiQypIqfwNGJyGvMd+l+as/jEJG/RQVgOVd+pzgp0dpfTARqhjJ+gDhg56oSBrgBOYPVelqz9N0JQ==
X-Received: by 2002:a17:90a:3a81:: with SMTP id
 b1mr6809564pjc.184.1587064425815; 
 Thu, 16 Apr 2020 12:13:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d18sm7878317pfq.177.2020.04.16.12.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 12:13:44 -0700 (PDT)
Date: Thu, 16 Apr 2020 12:13:44 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Apr 2020 12:13:41 PDT (-0700)
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-c7095cf1-fe5b-47fb-b510-7d4ee718cdbe@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jPAQr-000VxE-5b
X-Mailman-Approved-At: Mon, 20 Apr 2020 11:22:39 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/5] riscv: Add KGDB and KDB support
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

On Tue, 31 Mar 2020 08:23:06 PDT (-0700), vincent.chen@sifive.com wrote:
> This patch set implements required ports to enable RISC-V kernel to support
> KGDB and KDB features. Because there is no immediate value in the RISC-V
> trap instruction, the kernel cannot identify the purpose of each trap
> exception through the opcode. This makes the existing identification
> schemes in other architecture unsuitable for the RISC-V kernel. In order
> to solve this problem, this patch adds the kgdb_has_hit_break() to kgdb.c
> to help the RISC-V kernel identify the KGDB trap exception. In addition,
> the XML target description was introduced in this patch set to enable KGDB
> to report the contents of the status, cause and steal registers.
>
> This patchset has passed the kgdbts test suite provided by Linux kernel on
> HiFive unleashed board and QEMU.
>
> Changes since v1:
> 1. Replace the magic number with macro when filling the gdb_regs[].
> 2. Only support GDB XML packet instead of all query packets.
> 3. Move the macros used to parse instrcuton to parse_asm.h
>
>
> Vincent Chen (5):
>   kgdb: Add kgdb_has_hit_break function
>   riscv: Add KGDB support
>   kgdb: enable arch to support XML packet support.
>   riscv: Use the XML target descriptions to report 3 system registers
>   riscv: Add SW single-step support for KDB
>
>  arch/riscv/Kconfig                 |   2 +
>  arch/riscv/include/asm/Kbuild      |   1 -
>  arch/riscv/include/asm/gdb_xml.h   | 117 ++++++++++++
>  arch/riscv/include/asm/kdebug.h    |  12 ++
>  arch/riscv/include/asm/kgdb.h      | 113 +++++++++++
>  arch/riscv/include/asm/parse_asm.h | 214 +++++++++++++++++++++
>  arch/riscv/kernel/Makefile         |   1 +
>  arch/riscv/kernel/kgdb.c           | 382 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/traps.c          |   5 +
>  include/linux/kgdb.h               |   9 +
>  kernel/debug/debug_core.c          |  12 ++
>  kernel/debug/gdbstub.c             |  13 ++
>  lib/Kconfig.kgdb                   |   5 +
>  13 files changed, 885 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/gdb_xml.h
>  create mode 100644 arch/riscv/include/asm/kdebug.h
>  create mode 100644 arch/riscv/include/asm/kgdb.h
>  create mode 100644 arch/riscv/include/asm/parse_asm.h
>  create mode 100644 arch/riscv/kernel/kgdb.c

Looks like there's some comments on #3, so I'm going to drop this patch set and
assum there will be another version coming.

Thanks!


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
