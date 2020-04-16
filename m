Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FC1AB602
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2020 04:44:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jOuVx-0002qK-Og
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Apr 2020 02:44:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jOuVw-0002qD-7q
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 02:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=er76urwQouI/g3SR1sFnjn6b41XHAVJ+xxkv1n1+Ec4=; b=Vvc3AjlLXZHaLOJY7nqW2xmZQ/
 VFSXuPRoFd6uuDTAdc7YRXvoARtqwszqiI30DZAHVNuc7Byn4xu6XbDlhVcaGBxKJ2GODVU95Y0WS
 8Y2MNv4+Z3zQnSIW6bty6sJCWJhlWhx2o9qCX1hUivjmmDMRM7QLJN8pd9qCWGflDupo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=er76urwQouI/g3SR1sFnjn6b41XHAVJ+xxkv1n1+Ec4=; b=dWM7VQGMFo/ZJ7uYH8Px2YhGi/
 jlfAxRQ6Q5Pyrvqw+UwCVoOD6gRee4wyIMoFRSG4Ci3gv9/lyTT/h0EsavO4Ovn25kriXWDcTGQZx
 NIU0eiornOkHTMzEQ26wAACdSRAO5exEnUAVDV02m2eB59mH/OjypouORBjlCKvQEvww=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOuVt-001KDW-R3
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 02:44:28 +0000
Received: by mail-il1-f193.google.com with SMTP id b18so5522069ilf.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Apr 2020 19:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=er76urwQouI/g3SR1sFnjn6b41XHAVJ+xxkv1n1+Ec4=;
 b=WH1MB3z7pOhcqPVlT7qwJ9p0d7IU5DyXqw1eclK5R8of6TCBgsOJAvTg5JS2Cd2G2E
 kAvHk5b962HXajhhqF5RBAxN7CZUCDJp/UzrQATNCeEVvkfYJ39k4aa+NMwYOpGCZJDi
 lSrqGw3k73+BsG6CytmU+os3gQtFkC1cXFSuvYmahP6MRwlrQKu9wmDUjpvwBHof4X+W
 hhXa9sN1GvBltKQJUidC4Rkpf/LZxk1SHQjLAx2/SMrMyUZht9w6No4JVhMnNJmvjquJ
 E4EeLqQwhJnOX8YIo/0KjxmE93KVVUt2wDnP7WNxpTU/hnt+N2ZgXN8+2qIoCwevL2JK
 v0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=er76urwQouI/g3SR1sFnjn6b41XHAVJ+xxkv1n1+Ec4=;
 b=azDH1zLEU/GiThTv5njH/wlCVkzYRpNZngib8a3IUYVXYodhb7d/KfNEe+uuIyWcF5
 xN9j7JXb7NrC3DSrvoie1cq8rlV1tn7kaVNY9HnZPPImvV4+EivFefAQ2Q+BTNGXwD9O
 93Q7KW5Ly5AD7/zOeuIvxjQ0ZSz4ExqQnulLusIGrdiACFmKHAtIHVmwL/rARrKxfgGW
 ZlHpy31bkiH8uP1OOUj/RnOACZtYqp2hi8JQlExu/rfw3NO5BYi6nUepo4bJ68IrK1RI
 IIca71VCnM9ef6bF/edSCiUcYGBrwxdwXBUB74XPWBUSPv2OKP7rH7SkvoGsOojQEHdd
 SzJw==
X-Gm-Message-State: AGi0PuZ4DFWN5lNj2+Dblrbswijisp/eSys4aePRtM7q0uStFS1HZrCR
 kXWlZ1oSqalbZNqcBbEUNNRCvzPFntE=
X-Google-Smtp-Source: APiQypIJPYyeProR+zepCLcJ4I5gb3Q6SCuCSZCzWrI8tHCi6iGK+zdkrN046gQYzO0c30ub3C5ngw==
X-Received: by 2002:a63:1665:: with SMTP id 37mr30216071pgw.308.1587004704648; 
 Wed, 15 Apr 2020 19:38:24 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i25sm11347536pfd.140.2020.04.15.19.38.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 19:38:24 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Thu, 16 Apr 2020 10:38:03 +0800
Message-Id: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOuVt-001KDW-R3
Subject: [Kgdb-bugreport] [PATCH v4 0/5] Add KGDB and KDB support
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
to report the contents of the $status, $cause and $badaddr registers.
 
This patchset has passed the kgdbts test suite provided by Linux kernel on
HiFive unleashed board and QEMU.

Changes since v3:
1. remove duplicate macro defition
2. Rename CONFIG_ARCH_SUPPORTS_GDB_XML to CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
   in the description of patch 03/05.

Changes since v2:
1. Fix typos
2. Rename CONFIG_ARCH_SUPPORTS_GDB_XML to CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
3. Add the prefix kgdb_ to the handler functions and arrays that handle 
   "qxfer" packets

Changes since v1:
1. Replace the magic number with macro when filling the gdb_regs[].
2. Only support GDB XML packet instead of all query packets.
3. Move the macros used to parse instructions to parse_asm.h

Vincent Chen (5):
  kgdb: Add kgdb_has_hit_break function
  riscv: Add KGDB support
  kgdb: enable arch to support XML packet support.
  riscv: Use the XML target descriptions to report 3 system registers
  riscv: Add SW single-step support for KDB

 arch/riscv/Kconfig                 |   2 +
 arch/riscv/include/asm/gdb_xml.h   | 117 +++++++++++
 arch/riscv/include/asm/kdebug.h    |  12 ++
 arch/riscv/include/asm/kgdb.h      | 112 +++++++++++
 arch/riscv/include/asm/parse_asm.h | 219 +++++++++++++++++++++
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/kgdb.c           | 390 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c          |   5 +
 include/linux/kgdb.h               |  11 ++
 kernel/debug/debug_core.c          |  12 ++
 kernel/debug/gdbstub.c             |  13 ++
 lib/Kconfig.kgdb                   |   5 +
 12 files changed, 899 insertions(+)
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
