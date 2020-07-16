Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F242226C2
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 17:20:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw5gI-00048I-GU
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 15:20:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jw5gG-000483-Vg
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lvV+kZFJ+bicRAujhVqigbzFyFgwaE2AZB7+TjHL0wQ=; b=fSglhgtKt9e43MWsHZr9Tq5Dhg
 vxep9JU4XaTO09yedH0BmfJZzd2pFTw3DnZrQxkVSV12GVxT5ncE+N9W6tgW/r/HQVxuOzoPPqfGw
 VcVbA20HVDI2Xt6SIpSF+cJkZNbBX0RIORHikqUsXs78NyI4ZSVTBl7cHHlyB45KZ4BM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lvV+kZFJ+bicRAujhVqigbzFyFgwaE2AZB7+TjHL0wQ=; b=B
 HBvtLXrtDfHgaL3Kg2sOsuQMTZD/qVgVkei6PARo59BI9PAZ3wmGADiZH7hI6pHFmkDspNodB59zF
 PprzHock0jJ6AB9tjlhTa+JWicqBkcIOL4s5FEI0/jStq8HC99QonPe53yGkk/R18AZQzkjJfqD7y
 87FNdscHrvFmR98Y=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw5gB-00AaDd-2R
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:16 +0000
Received: by mail-wr1-f66.google.com with SMTP id j4so7438480wrp.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lvV+kZFJ+bicRAujhVqigbzFyFgwaE2AZB7+TjHL0wQ=;
 b=EKI/7sa6o0FAd3JpJEwHJfrgB5xUNL0OcbuVaKplDph58T1lYOzZjdBhP5dKoWmGYI
 sXeEjWOazGVnXWV0Yc0TQC4ZiOaCbPkx83Q9aJSunxrfALQeqcykNaJ9XSeMBNrgiRY+
 LaM/JhelnlGBhQmf+ZTb+y4UJ9M8KgBkFRlwSxlbELIRG+M229S++tv1nUvFQdZdAHVX
 Agkwi2ecorBoRct3RZvOKHVpZXe6yVQIvgaWbKVjw0KWboDskHI/7dvFkx1eaE3z5KJa
 gOzvKZkPl3QT+rAtFg+vDZqX/Fd2qbPOQpMaA2NG274TTDPe8yevyQSl8ZNcUnicKilF
 94RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lvV+kZFJ+bicRAujhVqigbzFyFgwaE2AZB7+TjHL0wQ=;
 b=rCBE9Ht0JYHUhOYZd3PE45vTKinqDdeptBsEy3uINfjAoHXdpO5B1rq5xD0HRCgloP
 wuR6DFB/VqY9jUQKo2zVJ3Q2Tv/p/STNBTq3Z1AmSEQF6lhtsexaVG1OeKlkFZoGPLDq
 VJXbijDjWGkvVj25Jjre1cuPKfDzL4VnGbw95l20Oy6IyOGkghZMua+3ef42VetxAA1i
 T7VlMbfVCfXD7pbu4QcdsOJb2Deh5eYZoP94S9R9MRPfKFgFylzR6NGphIKzmO8yKd5e
 X/8hl5CQOOBvEtf0/gHa8FteDbMjjceqjMqkIUN/y/Ue4lirV05sgc7eBYUkj0WiDccI
 Um7g==
X-Gm-Message-State: AOAM532dSSjWAaIQk6IfdA4KmdbcEu3aZIxAzTEryj+2MKQbnTahi5fW
 11NRoeb0wQ3ZdgLeLr8vXv9QQg==
X-Google-Smtp-Source: ABdhPJyrDSufKPQY0n9MIqAfHzqEFnuWTuX77ZT7VEwVUVOGP/zuzHSlc6Ko9MMqOb5l7XR70/gnnw==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr5493759wrq.91.1594912804657; 
 Thu, 16 Jul 2020 08:20:04 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u17sm9877687wrp.70.2020.07.16.08.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:20:03 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 16 Jul 2020 16:19:40 +0100
Message-Id: <20200716151943.2167652-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jw5gB-00AaDd-2R
Subject: [Kgdb-bugreport] [PATCH v2 0/3] kgdb: Honour the kprobe blacklist
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


Daniel Thompson (3):
  kgdb: Honour the kprobe blocklist when setting breakpoints
  kgdb: Use the kprobe blocklist to limit single stepping
  kgdb: Add NOKPROBE labels on the trap handler functions

 include/linux/kgdb.h        | 19 +++++++++++++++++++
 kernel/debug/debug_core.c   | 25 +++++++++++++++++++++++++
 kernel/debug/gdbstub.c      | 10 +++++++++-
 kernel/debug/kdb/kdb_bp.c   | 17 +++++++++++------
 kernel/debug/kdb/kdb_main.c | 10 ++++++++--
 lib/Kconfig.kgdb            | 14 ++++++++++++++
 6 files changed, 86 insertions(+), 9 deletions(-)

--
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
