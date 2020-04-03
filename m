Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EB019D4B8
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  3 Apr 2020 12:12:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jKJJc-0005GD-0k
	for lists+kgdb-bugreport@lfdr.de; Fri, 03 Apr 2020 10:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jKJJY-0005G3-Kb
 for kgdb-bugreport@lists.sourceforge.net; Fri, 03 Apr 2020 10:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fxWD5xD1kw2v28yDVrvDJkghPKBx/ATy5cWQRGW6rXI=; b=kzQ0wzqyraZ68pT835m5wfz/8/
 EpYH/Jp0NmTlOoF0cHKhnOsIK+lt86rY3NfeAONmVFNXPHCscJLuAMRJt4yhRUaImVGD3txFGHznU
 eY3qjeG2+qw5pVuuOyD+37XtcspVEeDfRDf3sIemy5MM+dZJxgIgF4cbuwO803W9Tak4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fxWD5xD1kw2v28yDVrvDJkghPKBx/ATy5cWQRGW6rXI=; b=ZZDIquTYj/sXUt04kli2y915y4
 5yd7n4hDz5lNcrc70Z1wzbTvmOy+1WD4ddJQSl5PxvbUZef4zMMFAvQoESp9/H4uO3gzbKQuwA4ND
 IAZ8Fn6QPplfBd9Q2Fc/clK3rAjnlyPpXF55/+tMvJAJ916ESR+Mg1NivfjdQJ0U5sPs=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jKJJU-000FBN-My
 for kgdb-bugreport@lists.sourceforge.net; Fri, 03 Apr 2020 10:12:40 +0000
Received: by mail-wr1-f66.google.com with SMTP id p10so7821829wrt.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 03 Apr 2020 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fxWD5xD1kw2v28yDVrvDJkghPKBx/ATy5cWQRGW6rXI=;
 b=zDi0W/4zhSRQ0MrYET/k3kVIY1ln6S7n48qg1chJSVbqXW9yM/0IO5KFqJXYvy1ui9
 nf9YRLVhQbIaWBmc9xUvv0qn1pILp21V0Fdf304KGSTUUKZ8FW58CvJxyaK4ZkvvKKEC
 FqTepxF7OruGicK7sanOHdsTPgd7RleiokbMA85TIq0s/k+HMXj8Vefvh7EvHhFETjlF
 7bx4WyTujIZq6muwzmH/ZsMWFf30gYKlBzBA+hpbXC27ypEy4NeuDQiRaE7F1aYV4b5x
 O8wIfqx+i8bpYDygsJsBJ7RjVAs+fxX+ry5Y28U63bvqtCMFuQNGenb/yvNYXMbn7Gmk
 NoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fxWD5xD1kw2v28yDVrvDJkghPKBx/ATy5cWQRGW6rXI=;
 b=WInHqM/W32/JZ1a5t+ZT9HABdvLK9cmrVcCkeiltR6ijaZcVof0Zg+8pkloOijwUMD
 woQoahKbv53SSgUgen2/mntwEQ0ZDnmDTUN7Ng1q4iF0cPpBQ2qBUztpyD0U+hzcpwj+
 X3x5CNlnzm/l+bkUXqPZ/ulgwXT8P70qoh0DXjhQ48qlNQ0C/zmwVIrfHVDTZtgb7wv3
 TMAV6bRAxEsX/7hk0ciE9cleKU6NRmYYjDJ+nXVnjZ4+Zrl/MxQ/c79BJkyLSTK53Klm
 UuVt4bQ4Cl/gpdeRRnp4EQoftzYLAtGOCdPUG7ZpxIwRtD6VM/vN3L+NOKUW1T/KCynM
 oYhw==
X-Gm-Message-State: AGi0PuYGOto56Mh81JtYBi94EmgI7HbHJ3+d6M1RYUhwUEPQIqeLBRMY
 RJGqNE/15A1W4azxf8IUq3qE9Q==
X-Google-Smtp-Source: APiQypIsfyXgVfhNO1vKd2FVpsPOslYIorcaKsbXxLEGP23BeSTs1ok53J13wfnFfwKRwXOL1o63ZQ==
X-Received: by 2002:adf:a48d:: with SMTP id g13mr8758646wrb.38.1585908750118; 
 Fri, 03 Apr 2020 03:12:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 98sm11779642wrk.52.2020.04.03.03.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 03:12:29 -0700 (PDT)
Date: Fri, 3 Apr 2020 11:12:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Vincent Chen <vincent.chen@sifive.com>
Message-ID: <20200403101227.74abwoyxzx4rlake@holly.lan>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jKJJU-000FBN-My
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
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 31, 2020 at 11:23:06PM +0800, Vincent Chen wrote:
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

Can you share the defconfig and qemu boot lines used for testing.

I'd like to see if they can easily be integrated into kgdbtest. Normally
figuring out the qemu boot line is the hardest bit of adding support for
an architecture one is not familar with.


Daniel.


PS At the moment it helps kgdbtest a lot if qemu is configured with two
   serial ports but I really should get round to relaxing that!

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
> 
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
