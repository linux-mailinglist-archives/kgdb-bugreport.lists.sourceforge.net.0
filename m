Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C481E9C50
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 06:03:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfbfd-0003gC-Jo
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 04:03:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jfbfc-0003fv-0R
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bLgtIoa0/aGLhXFInfRTNTOzuJef6BrK68uDNEPJ828=; b=PxlN1wrz64RKCxXnmFFBM7nyhn
 qaMK9cOPPzJhQ5NzL9MwzazvBp6SzPRD7wOC5VqfzRXaorNDD7jpGpZUFR6MhsETZiv55wqHdEvzD
 aOJlfjycYbeKU7WRkGXYCLQ3SNl9+3qGcsGWuyWbBkKekze1ZazMESP4PYI26DpnuDjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bLgtIoa0/aGLhXFInfRTNTOzuJef6BrK68uDNEPJ828=; b=eQah2UawcL7QJuezDYZ/tfNzP2
 BF5sJyyC9GDbsPF6DbEDrxnkCIYRKC4VehKN71hpWnrtEK+viC+XPguPB4xMyTg4xCDhpNOsvEEmy
 jTk0C8EPwcbfTIKEexc3n1j+afxClAllfFHojkC1SkaGkLH2BuV3+K7MFki2vVu2XtTw=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfbfZ-005o10-Vb
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:03:27 +0000
Received: by mail-oi1-f193.google.com with SMTP id z9so7901638oid.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 31 May 2020 21:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=bLgtIoa0/aGLhXFInfRTNTOzuJef6BrK68uDNEPJ828=;
 b=l/39mjMYoO4oJS7luzELO/2lW6/U5tiAstokV624lALvgDs/+o2LC4/+hpVixSJV5W
 fcEtxrHIuP0fR7gooFk1LFMBbVHXYFoHNFpsg4v41ujdZDnZQB1H3DBDIGUCCrHidU6J
 RAhEaoyoQeSzsQB1G3eP+uKBKgBUmL0OVA4NrXXoxPKvKtBUekbcsOlaIU33GjEBE/NG
 IjVTs6I8mLYBvX2GPsGjg2aS412x3dk4o9s2YuVG+EfwjsaS0nXE1hqGfNNl1rvM55Gs
 J/mSt13e6ZyC74iYZ/9MabKN1e3nyAX+pnvpHZRYcYsbgyQph3MT1CDKkHT71yEonWkD
 0HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bLgtIoa0/aGLhXFInfRTNTOzuJef6BrK68uDNEPJ828=;
 b=RrTitqUDdnlV5Pz3Pkrb/gy2+9b+5QFOf+pbVWsZAm4r62jG+noRXoWbMmrIVjpjt4
 ExxTfnWKO1gwadrYoWLEEwwtvZMohZYNMD37F7ad8F2PQ/ua56n6tm4NMxTeb2uJjhf5
 tlzolorwoFHlPVarbBB4NfLMRg42GzPNJRR4M6U4+CqMLMJZu9jOd6VCZockymtjTQ7Y
 mBvb5TDqgUcEqXBAMR8oFX8ERd/n4kuLxLkf1C6BPRfXr7H3kVOscrPbVDGeoFNDmQez
 6u5nIBioXzt3B7KbNDaq7xeM9Bn3OtKacPzZkULnGpwoAXxyxaLyXBLoEN8aRNX1s8Uw
 jNRg==
X-Gm-Message-State: AOAM533mUvqsByDWokiEiQLleyzybADyO7awSIFtX8u/jh0MYXpdunOx
 WICoA0cY8q9LEg672cIS6Rasd+6xGto=
X-Google-Smtp-Source: ABdhPJyaXFKUI77HVVvT+YA0Q4SIs611TTmJS4kGLNRX4MpwaPhrWamKOQdsj4C1z8tTwztJpAISqw==
X-Received: by 2002:a17:90b:792:: with SMTP id
 l18mr20066413pjz.24.1590982792816; 
 Sun, 31 May 2020 20:39:52 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (2001-b400-e3df-96c7-30f0-f751-b645-f4e3.emome-ip6.hinet.net.
 [2001:b400:e3df:96c7:30f0:f751:b645:f4e3])
 by smtp.gmail.com with ESMTPSA id a7sm13102527pfa.187.2020.05.31.20.39.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 20:39:52 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Mon,  1 Jun 2020 11:39:05 +0800
Message-Id: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jfbfZ-005o10-Vb
Subject: [Kgdb-bugreport] [V5 patch 0/6] riscv: Add KGDB and KDB support
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

Changes since v4:
1. Fix some compile warnings reported by linux kbuild test
2. Select ARCH_OPTIONAL_KERNEL_RWX to enable the kconfig prompt of
   CONFIG_STRICT_KERNEL_RWX

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



Vincent Chen (6):
  kgdb: Add kgdb_has_hit_break function
  riscv: Add KGDB support
  kgdb: enable arch to support XML packet support.
  riscv: enable the Kconfig prompt of STRICT_KERNEL_RWX
  riscv: Use the XML target descriptions to report 3 system registers
  riscv: Add SW single-step support for KDB

 arch/riscv/Kconfig                 |   3 +
 arch/riscv/include/asm/gdb_xml.h   | 116 +++++++++++
 arch/riscv/include/asm/kdebug.h    |  12 ++
 arch/riscv/include/asm/kgdb.h      | 113 +++++++++++
 arch/riscv/include/asm/parse_asm.h | 219 +++++++++++++++++++++
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/kgdb.c           | 392 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c          |   5 +
 include/linux/kgdb.h               |  12 ++
 kernel/debug/debug_core.c          |  12 ++
 kernel/debug/gdbstub.c             |  13 ++
 lib/Kconfig.kgdb                   |   5 +
 12 files changed, 903 insertions(+)
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
