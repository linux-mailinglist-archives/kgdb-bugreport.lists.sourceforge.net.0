Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE8268BA1
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Sep 2020 15:02:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kHo7h-0004V4-9n
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Sep 2020 13:02:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kHo7e-0004UN-5D
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j11jZizj6KykwFnlMpZUSmD4ixbxGJ3f+H4sr6REKAc=; b=KwuCqH9YYvhgaZTvQQihpbZRv5
 Bt/98ZbF7oUPCOZvc4ENr5svIpHe5CS1uYD5pp6EekfyQFtXbtvFXvESaIy57gbn13NqN/xYkX3wy
 LXEDfKEBRvoZjZyuq7m4l+qzbRbva+Sbnl+4p6BX1J6kfeX3q2eZz12kfTgLwZc/vobI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j11jZizj6KykwFnlMpZUSmD4ixbxGJ3f+H4sr6REKAc=; b=W
 Aj9GYOoIqd96urQFJW7E16OmUjQXVmwg51z4+bKxGMZxYzce4QcSg3BxmMA+J/XmMKIF2nrzQJ93u
 /7fNaH5WYlE5isWHh7bo2Zy5N1yOQ4IXH/RlvD6d/VYMVbg1pdGa0/mXl96A6VEdJQGBT8bNxzczc
 fd7av6BWusYM5a+M=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHo7b-008PXS-0G
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:18 +0000
Received: by mail-wm1-f68.google.com with SMTP id w2so10555843wmi.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j11jZizj6KykwFnlMpZUSmD4ixbxGJ3f+H4sr6REKAc=;
 b=U5sDUJFQGkIzR4rv2WYyCEAIfiTmifUAhGXlILPOKVoorTjbw4oLiuAFTBoRzYx0ri
 l7SDFvtolHpXNL6iGcVzBS1H5jSmDDlXbOqJLF1J3WwIKyFl/PPtRvncDFLus+y/CNCx
 o0zx8DAEFW8VIa/cwUBx81/a2fGm/vK1WaCRlHaisfadEfW6aw0YCHLQiVMXINzoytlN
 bDIxdwbbxzRWs7QYkW3jWldNDCu7xcwWyvbxUR1iFefkpyTfJpOrSIgaGEwJanBvHVPL
 u1DlClDDd/bHNPtXcaBW0N9CiYQdMp/5YFjqcwgcTab8jL0X12Qg6kGCqu0DeHiknJ3O
 KLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j11jZizj6KykwFnlMpZUSmD4ixbxGJ3f+H4sr6REKAc=;
 b=crPkAsqcJNzuYGzjhqjiuB6qSvXtoHH7b2I778RqF3HeIWkSaB1SNV1uuyYU7jSFo+
 GnuiQuM+qX6pEWryIu+mWm1C3BbrM/YwIvQbqGVmd0enPKpnI2EiSrmUHbwKMBYJZEsa
 iH0uXJQSMgPjW5AKOeixuusYzeJ+MkuZEfDmhc1wOUStTjJ84rvdYB46fE/rYmm/eCXn
 DBHECj7tzdeOqLVPDTjZ/w1Xour+onJbTRvVVqT31B3KDU+zOsuKb1zJJUp6xI5Qfjx1
 pWa13zEDeP5q+ywMb7/ZXWxb4tfMgIPypsrTrAqpWl4WK/2VCeLAT0Xe8cGUjlFo9fn5
 MIKQ==
X-Gm-Message-State: AOAM531lKsWYU8gD58s5ZGB4BeOAn1ijMISmLJnzXZDGJo0KlM7lGKCq
 4bHvZ22KyrBiTSFpO/QZ09/P5rws/RABkA==
X-Google-Smtp-Source: ABdhPJzIfCh1Zp0fe1yIl/k1EaljKHGFxBKKBpawbZYBW4iZy0TnSRtO4zLscJ9c22EXcbqJvFjplg==
X-Received: by 2002:a1c:7502:: with SMTP id o2mr14623468wmc.29.1600088521467; 
 Mon, 14 Sep 2020 06:02:01 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t6sm23420983wre.30.2020.09.14.06.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:02:00 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2020 14:01:40 +0100
Message-Id: <20200914130143.1322802-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kHo7b-008PXS-0G
Subject: [Kgdb-bugreport] [PATCH v3 0/3] kgdb: Honour the kprobe blocklist
 when setting breakpoints
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, pmladek@suse.com,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 patches@linaro.org, linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

kgdb has traditionally adopted a no safety rails approach to breakpoint
placement. If the debugger is commanded to place a breakpoint at an
address then it will do so even if that breakpoint results in kgdb
becoming inoperable.

A stop-the-world debugger with memory peek/poke intrinsically provides
its operator with the means to hose their system in all manner of
exciting ways (not least because stopping-the-world is already a DoS
attack ;-) ). Nevertheless the current no safety rail approach is
difficult to defend, especially given kprobes can provide us with plenty
of machinery to mark the parts of the kernel where breakpointing is
discouraged.

This patchset introduces some safety rails by using the existing kprobes
infrastructure and ensures this will be enabled by default on
architectures that implement kprobes. At present it does not cover
absolutely all locations where breakpoints can cause trouble but it will
block off several avenues, including the architecture specific parts
that are handled by arch_within_kprobe_blacklist().

v3:
* Dropped the single step blocklist checks. It is not proven that the
  code was actually reachable without triggering the catastrophic
  failure flag (which inhibits resume already).
* Update patch description for ("kgdb: Add NOKPROBE labels...") and
  added symbols that are called during trap exit
* Added a new patch to push the breakpoint activation later in the
  flow and ensure the I/O functions are not called with breakpoints
  activated.

v2:
* Reworked after initial RFC to make honouring the blocklist require
  CONFIG_KPROBES. It is not optional but the blocklist will be enabled
  by default for architectures that CONFIG_HAVE_KPROBES

Daniel Thompson (3):
  kgdb: Honour the kprobe blocklist when setting breakpoints
  kgdb: Add NOKPROBE labels on the trap handler functions
  kernel: debug: Centralize dbg_[de]activate_sw_breakpoints

 include/linux/kgdb.h            | 18 ++++++++++++++++++
 kernel/debug/debug_core.c       | 17 +++++++++++++++++
 kernel/debug/gdbstub.c          |  1 -
 kernel/debug/kdb/kdb_bp.c       |  9 +++++++++
 kernel/debug/kdb/kdb_debugger.c |  2 --
 lib/Kconfig.kgdb                | 14 ++++++++++++++
 6 files changed, 58 insertions(+), 3 deletions(-)

--
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
