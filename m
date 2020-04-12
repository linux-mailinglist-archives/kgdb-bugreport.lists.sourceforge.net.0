Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CB1A5BD0
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 Apr 2020 03:42:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jNRdb-0007Ea-As
	for lists+kgdb-bugreport@lfdr.de; Sun, 12 Apr 2020 01:42:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jNRda-0007ET-A0
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tK7Fpv4aCmQXwDlW18NmZl3nQqaQA+3l7FQ39AlK2Tk=; b=lbrznDoqZF75mNzAw7uBSCk8qE
 T23V6q0f8Xyf6JCsN9wtbSUfvuNse4/jrMkAeNQx5bV8gQcNNRdJAk0gKKuJPrVHfWJgmrzFAT1cF
 DgBUku5hTrdf8OPaA6cmhAEtXhc3WH7IuNAxbOtETo4+Rf0mHYZ0eHQr7tDMBbeTMeMk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tK7Fpv4aCmQXwDlW18NmZl3nQqaQA+3l7FQ39AlK2Tk=; b=Dh6R8LL+EiftpZCYvpIvWPCdis
 oH/llW1HF29nCle1LNFkO9J76oECmVhxSwqNVHQ0+ATDrfIs+Nv2tc+iunbnPdgy290i543AYAweq
 OTFguoqZ50quQE3uapYMsuYB0KjdglLag/6DRe4nvODpxW2VsQVUPh3T2QG81L705UDA=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jNRdV-00BuLC-HU
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:42:18 +0000
Received: by mail-pl1-f194.google.com with SMTP id w3so2117970plz.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 11 Apr 2020 18:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=tK7Fpv4aCmQXwDlW18NmZl3nQqaQA+3l7FQ39AlK2Tk=;
 b=lYvjiAiz6rGu0urXdA+Bc7PKP9bnQ4RC14QA+VzbdFHJtIEr1SlTLLNtVoKi3yFFJK
 +Ct2Xlnq9WdWi6Ijpe/i4Bsxemc6P0TUeetDtShsmt8xPinGLuIOI5TaiIZU3Jw8oIBT
 4NbeVTgUD+udYuC8u2Tg6D7g+hSvf6fNa7bOengUk1LlySTJYMEPF5Edw5iTasTsTjbC
 Bl8bYbodlyJ5SQE9CZNnpGOBwsaG7o08HmpHAvEq8p+nky5kyfh+acZdqaWkGGammu0e
 Y02+Ru8D1uU2iZSM3zaEOqVVUkPIyJralUTwXxTCecBciawpzssQh9ZLWpyKx4aPblGL
 zYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tK7Fpv4aCmQXwDlW18NmZl3nQqaQA+3l7FQ39AlK2Tk=;
 b=KZrTvSHzbftH/UxMtjoY14uOC9xgXg7zFUUn4DwRGESINXpxK1EhFHEmgFdUg3wcMO
 YXtOFyAQ+OhOnu/FmvYgkYMHV6Pi8ALkYFrQjssVQKlde3R546zsQ3VHWt5lcjCwG6Pr
 YXeE9z6y/EcNtFKsCmmdHLnGyffHP9q70DQhZrqTqUo+JGANnuR0rH9/bJIF0wfqWXr1
 5bg0/tCxxl7Uc9eA5GJvFIlNHuKJsZCIgYlTqqg041Pt9WITHQYwk4FCaZKvnCVDobsl
 fVvnOVrhzdUDDqqUOZl1DSef4XbvE7YP/YaYMK+S+cFh85dtc8pS6x15yBnFZaPq3hw4
 O8cQ==
X-Gm-Message-State: AGi0PuZi4MESi3PgGLlYRvNPcShZ5I2A8c73zfrwHJvM2iCxOcrrUllj
 7D8HcJcjo+sm9SQRvM8cxSKNIg==
X-Google-Smtp-Source: APiQypKLIMGGzCOutz9uEpF8wZgrif4zOooehO54sdMo0ZHoAOtjELmL0E8PkNP3E8TZeuB7B9GLMA==
X-Received: by 2002:a17:90a:a402:: with SMTP id
 y2mr14468910pjp.55.1586655727738; 
 Sat, 11 Apr 2020 18:42:07 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id w90sm5252900pjj.2.2020.04.11.18.42.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Apr 2020 18:42:07 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: daniel.thompson@linaro.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Sun, 12 Apr 2020 09:41:56 +0800
Message-Id: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jNRdV-00BuLC-HU
Subject: [Kgdb-bugreport] [PATCH v3 0/5] riscv: Add KGDB and KDB support
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
 arch/riscv/include/asm/kgdb.h      | 113 +++++++++++
 arch/riscv/include/asm/parse_asm.h | 219 +++++++++++++++++++++
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/kgdb.c           | 390 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c          |   5 +
 include/linux/kgdb.h               |  11 ++
 kernel/debug/debug_core.c          |  12 ++
 kernel/debug/gdbstub.c             |  13 ++
 lib/Kconfig.kgdb                   |   5 +
 12 files changed, 900 insertions(+)
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
