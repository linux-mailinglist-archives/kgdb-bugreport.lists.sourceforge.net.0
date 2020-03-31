Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874119AC84
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Apr 2020 15:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jJdFM-0007Wr-4O
	for lists+kgdb-bugreport@lfdr.de; Wed, 01 Apr 2020 13:17:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jJJYs-0004wG-3T
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 16:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wZvkrsTvKWJJwarpzQqe3RdmB0Y8HIsrHIBH6UKE3Ns=; b=htQSCApn2p9r2QWjhWqoUHklJB
 4Q4cVI2uMZUPQpckB/FCxgzXMJilFivNhPqHGL2LkInCuS39GSn/nthR8w1nd6AmvilbPt7O4TJKK
 jw03jSGLWibMvaVkBCriTv5+Y6eDi+gJMT1YS45AvXPmE0fUtJOn1PVQwvn2EE/np6oU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wZvkrsTvKWJJwarpzQqe3RdmB0Y8HIsrHIBH6UKE3Ns=; b=b6WEqVYxWP74zE5HKeVdNFmUop
 qyJyuP415sQv6ZODPao7XhQW7hMRCW89KDEEVrPudWqFzuGhI9GIo8LCNhUObQ6baThpfukO2Z6E2
 rArsHE1qpmgkFDhrfvbb4A8su84ZCeN8W0zprKzWx7o9VzeufGco6fV7FTCFohRItAMA=;
Received: from mail-qv1-f65.google.com ([209.85.219.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJJYn-0032sN-5N
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 16:16:22 +0000
Received: by mail-qv1-f65.google.com with SMTP id bp12so7137085qvb.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 31 Mar 2020 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=wZvkrsTvKWJJwarpzQqe3RdmB0Y8HIsrHIBH6UKE3Ns=;
 b=O9g7RXtJs7cCUnRFz50Wag9lPtR9pVMSAwTC+XpQIv4chnUhpSD/nBHRI1Av6oiTaL
 e4qfxp1JtLIipfUl7YIQuA8wvrN+l6M9/ts0ziS2dm4RHRCkJKnE+4seTQUj8vktTdCb
 jcSKJVXA68B3+agfyZNeR7h4yYhghwhHve7aFGxjHN7n1dhAo/Z189/uIR8FBWCftHJh
 G6W5Yze6UHS2u2+KMdwCfGk9VDEGDGZ4bmNzLW6TkiM09jlwP/DPbKlWHefieo098mUv
 0+5NPAsqC24sBdUOJh/O+J11MJoeINr2mLJfWnBt7FkzCfVv+rCHEdj2L9thGzx06uJK
 K1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wZvkrsTvKWJJwarpzQqe3RdmB0Y8HIsrHIBH6UKE3Ns=;
 b=F8Gnc+hpREMsTRJiP9Uoo+n9tqjqyd/AhvwESWbhogaBw8N2k9RfH6sX9Qf5V6fzqM
 ReHyRGmB8FKYCw1elyydNcD3gocK3jMGCWUka7133q8ooAuaw2DbDZcIp/90x97DFKKQ
 WSjAzZn9jqfIF2FXaUURKIFWjvpP3lkSpy2e823BoaZtnxScFaPypZu8BDOE7i9xy0Ny
 eOmZU5trp0ZqeAfmMRLAQE2ERNg7NdxF17yjJQ5vKoWCYRR19p1/3x184ShcLMQ+CPd/
 5pu8DyRXJpUlI4/DEtt+SjnH2TNqkA9v+Kkq7h7djWNI3qbBzdxt44+gYeNQly/T2qDF
 5oSA==
X-Gm-Message-State: ANhLgQ0fs3yRTuGdevsae/BOIfLkh+yI5y8batdMLQ4veH3RoEO/EVUz
 eqoHOKfQU4uqI3LOGGfdNQ566SrZ4RI=
X-Google-Smtp-Source: ADFU+vslsqWG+0MHtUhhG6suB0kUqlGstY2p6fR1Zyj4m/x7jnt1Bwiebb3Vo7xUIR16gIlNDYipAA==
X-Received: by 2002:aa7:9a89:: with SMTP id w9mr18477896pfi.149.1585668207070; 
 Tue, 31 Mar 2020 08:23:27 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id g30sm12097660pgn.40.2020.03.31.08.23.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Mar 2020 08:23:25 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Tue, 31 Mar 2020 23:23:06 +0800
Message-Id: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJJYn-0032sN-5N
X-Mailman-Approved-At: Wed, 01 Apr 2020 13:17:31 +0000
Subject: [Kgdb-bugreport] [PATCH v2 0/5] riscv: Add KGDB and KDB support
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

This patch set implements required ports to enable RISC-V kernel to support
KGDB and KDB features. Because there is no immediate value in the RISC-V
trap instruction, the kernel cannot identify the purpose of each trap
exception through the opcode. This makes the existing identification
schemes in other architecture unsuitable for the RISC-V kernel. In order
to solve this problem, this patch adds the kgdb_has_hit_break() to kgdb.c
to help the RISC-V kernel identify the KGDB trap exception. In addition,
the XML target description was introduced in this patch set to enable KGDB
to report the contents of the status, cause and steal registers.
 
This patchset has passed the kgdbts test suite provided by Linux kernel on
HiFive unleashed board and QEMU.

Changes since v1:
1. Replace the magic number with macro when filling the gdb_regs[].
2. Only support GDB XML packet instead of all query packets.
3. Move the macros used to parse instrcuton to parse_asm.h


Vincent Chen (5):
  kgdb: Add kgdb_has_hit_break function
  riscv: Add KGDB support
  kgdb: enable arch to support XML packet support.
  riscv: Use the XML target descriptions to report 3 system registers
  riscv: Add SW single-step support for KDB

 arch/riscv/Kconfig                 |   2 +
 arch/riscv/include/asm/Kbuild      |   1 -
 arch/riscv/include/asm/gdb_xml.h   | 117 ++++++++++++
 arch/riscv/include/asm/kdebug.h    |  12 ++
 arch/riscv/include/asm/kgdb.h      | 113 +++++++++++
 arch/riscv/include/asm/parse_asm.h | 214 +++++++++++++++++++++
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/kgdb.c           | 382 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c          |   5 +
 include/linux/kgdb.h               |   9 +
 kernel/debug/debug_core.c          |  12 ++
 kernel/debug/gdbstub.c             |  13 ++
 lib/Kconfig.kgdb                   |   5 +
 13 files changed, 885 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/gdb_xml.h
 create mode 100644 arch/riscv/include/asm/kdebug.h
 create mode 100644 arch/riscv/include/asm/kgdb.h
 create mode 100644 arch/riscv/include/asm/parse_asm.h
 create mode 100644 arch/riscv/kernel/kgdb.c

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
