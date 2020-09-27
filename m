Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1934827A43A
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 27 Sep 2020 23:16:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kMe1x-0003Go-TG
	for lists+kgdb-bugreport@lfdr.de; Sun, 27 Sep 2020 21:16:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kMe1w-0003GX-9N
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yzXzJiEQzaPFqdy2MIXLtzA73Bjzgyzv9JbfCBicRRs=; b=Isq41OFKGPaXFPVwYT2eWs0AM7
 9z6KuQTToePc5549mAVNEhLElZnAfQjEt1h3pPQ7m6g00XHSUgDH6y+eWe0tkwQyViAro7MCaqrbm
 NnHWS3QShgxB10lWJAFiUFztkz/7iXR6jOIodnALmuICp5hmtuQQjAtm2eveJHKkvCT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yzXzJiEQzaPFqdy2MIXLtzA73Bjzgyzv9JbfCBicRRs=; b=b
 ZUnhJwDXOZDZ72sxqPCqLdoTS6XktVKEQQvGjvkmh40LnczsPH/Jsx6yt9zMisqbLo+Nd3Gu2srhN
 LeaLulY2Kk0Tkc63+Yit34hCwiut9ktveec2WAg5fYlXFF8ibahEj+nDrg2qgyUGW//J8ndEiXIwk
 0QWJUjUlORrGogBc=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kMe1s-00842i-Ql
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:24 +0000
Received: by mail-wm1-f65.google.com with SMTP id y15so4939500wmi.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 27 Sep 2020 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzXzJiEQzaPFqdy2MIXLtzA73Bjzgyzv9JbfCBicRRs=;
 b=igyIzAGHvljICFK+IdbUtULqLeHSPyp6JXzjwbaqe8JGlP/t81CSxr057hte0SgvqC
 s1GdSXzsLau3c8d8TvlZ2X6nHK+u489twWeKQCcjTLHtFmW8xAO/Sce0ReF+nHi4WMFp
 v8ym2R5v+4LFIuEyudixhrzuyMlww1UrKQETRlCpwXD9TvXM20ugVZfrn2viNTYhvCki
 oc6P14j/c2TrJP4jtnN9I3dF7FmkEc5HLL4Jj1ftXuXUjxZULyCrpzyg/nbjYMNj4bdw
 BnOi9r9TdbodLirQuJrahQhkVWaCOlph68bnak4hOwoXMgG6uMXksvEXXgZAMbVEwU3M
 IFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzXzJiEQzaPFqdy2MIXLtzA73Bjzgyzv9JbfCBicRRs=;
 b=fxqtCZlHoFSXInQGE0Mbq/BAJCzL4ye6vI0hfuyPOC0WmsvumS4cKWmNpJv4EoMT+g
 dAnqH8bWnL9G/yvyGXvvlcJTriPgirIxfYnKzVkWsvmSduGGY/jDOlZE9fuXGPBU8wm7
 Cch/6w2hKKJcJSmfDXRfURSNCTG+kmLq2ZasfOKQcvs7QWo2iFJ7GJdjZn8Lh2VGtsDB
 yDVililP8lawlCq8/rX1fAgTj/2l9KvvVw39KusjCCUzlzSDa0LRRP89osx48uJUUjqZ
 /DiwZDyrEf/HOJaB4jWnuabXFmqYTdjzJxuLy4+pnQJEGRAE2LksPyTZNbcPD4t9n8EJ
 5KAw==
X-Gm-Message-State: AOAM533BYRcLeWjslWo0M2OzpJgSwdq66M6xOZigwUghmR1VgFGjIiy6
 YXHJSWv9wJCzW5FXhQ80VKNRww==
X-Google-Smtp-Source: ABdhPJw6VoFcPo1scinS68irhUR+vggXWVATUkZHK+aYqRklkunCw9o1l/IXKGL2BA0qd2LyeF3Epw==
X-Received: by 2002:a05:600c:2f8f:: with SMTP id
 t15mr8611991wmn.41.1601241374477; 
 Sun, 27 Sep 2020 14:16:14 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id s17sm11396676wrr.40.2020.09.27.14.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 14:16:13 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Sun, 27 Sep 2020 22:15:28 +0100
Message-Id: <20200927211531.1380577-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kMe1s-00842i-Ql
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

v4:
* Fixed KConfig dependencies for HONOUR_KPROBE_BLOCKLIST on kernels
  where MODULES=n
* Add additional debug_core.c functions to the blocklist (thanks Doug)
* Collected a few tags

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
  CONFIG_KPROBES. It is now optional but the blocklist will be enabled
  by default for architectures that CONFIG_HAVE_KPROBES

Daniel Thompson (3):
  kgdb: Honour the kprobe blocklist when setting breakpoints
  kgdb: Add NOKPROBE labels on the trap handler functions
  kernel: debug: Centralize dbg_[de]activate_sw_breakpoints

 include/linux/kgdb.h            | 18 ++++++++++++++++++
 kernel/debug/debug_core.c       | 22 ++++++++++++++++++++++
 kernel/debug/gdbstub.c          |  1 -
 kernel/debug/kdb/kdb_bp.c       |  9 +++++++++
 kernel/debug/kdb/kdb_debugger.c |  2 --
 lib/Kconfig.kgdb                | 15 +++++++++++++++
 6 files changed, 64 insertions(+), 3 deletions(-)

--
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
