Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FE19EF4F
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  6 Apr 2020 04:35:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jLHbt-0000ca-42
	for lists+kgdb-bugreport@lfdr.de; Mon, 06 Apr 2020 02:35:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jLHbr-0000cO-9k
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Apr 2020 02:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJkM/YidN7kWbOXxhjUPus+VASEIWhclvMLuNASyfdI=; b=Vu08jq16gPST7iCnmqoDeQF7t2
 JbmvMS75Vzelmk+SIKBzTTtSHB0yTXGaTP874D2y9x7Di0cL0i3BkroU/9iSZ6S0cSIH8g1x0t89p
 qfJ0abjKZnyVUMiVpfXHOldx9ygx5hBJme56RZ041fk7+jcUKjRNKWK8KWE6Gc0Bili0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJkM/YidN7kWbOXxhjUPus+VASEIWhclvMLuNASyfdI=; b=gerHnKv1UFkCVjqowU927gUKxC
 esyN4MqdjZiL0n/5ZMqTK0XVYJ1BJ1eYDHEF3rQcXQydcgifc18bDTQoI2ZipJTJd54USO1J9LuYg
 LKXz6GxMJIuC8kKLHOqtebkNPVdnn1xIxWP8n9L8kratbNlwHVJLrv+Sl1GQMgAFq7lk=;
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jLHbm-005E5B-TY
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Apr 2020 02:35:34 +0000
Received: by mail-qt1-f196.google.com with SMTP id m33so11782672qtb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 05 Apr 2020 19:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BJkM/YidN7kWbOXxhjUPus+VASEIWhclvMLuNASyfdI=;
 b=FQELrXDzJ7Nxx+rNCwpdKb4OC7Az3FTH3BrNNkzYYpjVUbSTdjS6bvRuFkupsdyfOc
 8b9Zybx0lNYAAQg5HyGCuOSlnUoupz5PePX0PRedNIRCI8W7Cw2mStJoqjK04RWe1yOu
 ESNpBZQf8ovUiFnPii2zlErgbD4et4T9XXbA5NTvPyBC4nuJIa7iWG7T0DWsf3NM1t+6
 8xmxeQlnuylgUtqpS7rUa6zXDdI0MtRSxwT4epbybIV1eWfsw25JZIs44AGs7/WlurmZ
 idVZWI1vjrsSTjAGA2Fg3qJjXhKj4cr6uWy8EiVtgOoeyEerqQRQfGYGFcr2YbI0AO/v
 CMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BJkM/YidN7kWbOXxhjUPus+VASEIWhclvMLuNASyfdI=;
 b=KEwQRO7VPaugbll2kF8rgb9OZ6gIpgDJBOmE/YYPyR2MrDY4lz+HattZT5BI4HtiDk
 FzxPIw5OqISj529P4FlWfsZU666Ke9yVEWVUuWdPguAjnaofdFTD5/u3Gvo3P/fZboJt
 FilpG+hpAcZHNlPw6SWUhgoOm/XiFs0pdgx/WMlqEP3RAwPacff7Jpr06znABpo0iJzS
 RIgAyaqtkU228JRoBSXhXYDWnidaUf6dH0MQdeeA8tvL95d0p5w913iaDopbTvrFIdsc
 j8wauuSLe4XNAZbjX3tnXRC/KVrBeCZflw5YYDQLHPBrjtxazXzmNNYwL6JG2/0D+FK/
 EsNA==
X-Gm-Message-State: AGi0PuZsG0smr3bEjRhmMNvIrWqmjqZBtXqtuxLQcHVDOTgdEWdGrqTy
 uPF7g4LRhErHx2kbBfXe5BnCPDkbTTcyKx/ODxeJ0Q==
X-Google-Smtp-Source: APiQypLcobAg9SYTLPE/P4YWfylm3KeLWO+U8SocXUxIXX8luYKSQwTE0hEiQZkPMP76hO4sxaS2CDAmumsw0QYAFLE=
X-Received: by 2002:ac8:7199:: with SMTP id w25mr1271249qto.86.1586140524718; 
 Sun, 05 Apr 2020 19:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
 <20200403101227.74abwoyxzx4rlake@holly.lan>
In-Reply-To: <20200403101227.74abwoyxzx4rlake@holly.lan>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 6 Apr 2020 10:35:13 +0800
Message-ID: <CABvJ_xh2pocd1xywyZ_4VQbs8eFO6ehQfsRkQTpdTDUJXbsXEg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.196 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jLHbm-005E5B-TY
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 3, 2020 at 6:12 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Mar 31, 2020 at 11:23:06PM +0800, Vincent Chen wrote:
> > This patch set implements required ports to enable RISC-V kernel to support
> > KGDB and KDB features. Because there is no immediate value in the RISC-V
> > trap instruction, the kernel cannot identify the purpose of each trap
> > exception through the opcode. This makes the existing identification
> > schemes in other architecture unsuitable for the RISC-V kernel. In order
> > to solve this problem, this patch adds the kgdb_has_hit_break() to kgdb.c
> > to help the RISC-V kernel identify the KGDB trap exception. In addition,
> > the XML target description was introduced in this patch set to enable KGDB
> > to report the contents of the status, cause and steal registers.
> >
> > This patchset has passed the kgdbts test suite provided by Linux kernel on
> > HiFive unleashed board and QEMU.
>
> Can you share the defconfig and qemu boot lines used for testing.
>
> I'd like to see if they can easily be integrated into kgdbtest. Normally
> figuring out the qemu boot line is the hardest bit of adding support for
> an architecture one is not familar with.
>
The process of building a RISC-V kernel is a bit different from other
architecture. Maybe you can refer the steps in
https://risc-v-getting-started-guide.readthedocs.io/en/latest/linux-qemu.html
to build the kernel image and run it.

For the Linux configuration used by KGDB, I just enable KGDB related
configuration based on riscv defconfig. The riscv defconfig can
founded in arch/riscv/configs/defconfig

The QEMU boot lines are listed in the following.

qemu-system-riscv64 -M virt -m 256M -nographic \
-kernel <bbl image>\
-append "debug root=/dev/vda rw console=ttyS0" \
-drive file=<root file system>,format=raw,id=hd0 \
-serial tcp:localhost:2345,server \
-gdb tcp::1133 \
-device virtio-blk-device,drive=hd0 \

>
> Daniel.
>
>
> PS At the moment it helps kgdbtest a lot if qemu is configured with two
>    serial ports but I really should get round to relaxing that!
>
> >
> > Changes since v1:
> > 1. Replace the magic number with macro when filling the gdb_regs[].
> > 2. Only support GDB XML packet instead of all query packets.
> > 3. Move the macros used to parse instrcuton to parse_asm.h
> >
> >
> > Vincent Chen (5):
> >   kgdb: Add kgdb_has_hit_break function
> >   riscv: Add KGDB support
> >   kgdb: enable arch to support XML packet support.
> >   riscv: Use the XML target descriptions to report 3 system registers
> >   riscv: Add SW single-step support for KDB
> >
> >  arch/riscv/Kconfig                 |   2 +
> >  arch/riscv/include/asm/Kbuild      |   1 -
> >  arch/riscv/include/asm/gdb_xml.h   | 117 ++++++++++++
> >  arch/riscv/include/asm/kdebug.h    |  12 ++
> >  arch/riscv/include/asm/kgdb.h      | 113 +++++++++++
> >  arch/riscv/include/asm/parse_asm.h | 214 +++++++++++++++++++++
> >  arch/riscv/kernel/Makefile         |   1 +
> >  arch/riscv/kernel/kgdb.c           | 382 +++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/traps.c          |   5 +
> >  include/linux/kgdb.h               |   9 +
> >  kernel/debug/debug_core.c          |  12 ++
> >  kernel/debug/gdbstub.c             |  13 ++
> >  lib/Kconfig.kgdb                   |   5 +
> >  13 files changed, 885 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/include/asm/gdb_xml.h
> >  create mode 100644 arch/riscv/include/asm/kdebug.h
> >  create mode 100644 arch/riscv/include/asm/kgdb.h
> >  create mode 100644 arch/riscv/include/asm/parse_asm.h
> >  create mode 100644 arch/riscv/kernel/kgdb.c
> >
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
