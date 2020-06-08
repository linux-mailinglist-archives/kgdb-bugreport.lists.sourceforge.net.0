Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E201F1A66
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Jun 2020 15:50:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jiIAZ-0002KV-0b
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Jun 2020 13:50:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jiIAX-0002KA-Pr
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Jun 2020 13:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvwgW89KNJaCpkAay5Bmt5Q5u2ENn3zZzl6ZGX4sCzs=; b=k3yqpqpWUgd5iWg8AFX35gG+L5
 ThjhmZ5vqIpcyIecTVki6IDwUSduhoqyI8a54XnDjkJ+yln88fcx31DOVd/7wq6+c4toEUKmAyPh1
 SzP9QO1whiGoe1nXG57GA7zLFd4Jc+indkszqWroxH1Qpa/PFK82oJAsE9G33IpXpu7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uvwgW89KNJaCpkAay5Bmt5Q5u2ENn3zZzl6ZGX4sCzs=; b=PtaAtzhULINvfu/5uCgLl63peb
 MLWd7YIerBn7Kk+LS/OlcU+72Z80G6Pb4DhXHPij5EvHDz0HPsgDrSx0ZsRyBN6eAoHZfAzizsyCK
 1OcwqJ8otQYSzdHJTRLExRu+0hC3kgtG0qftpqXDoDqCkVZKj7UHyvU9GfnJJNIFUUm8=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jiIAT-00DWSr-M2
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Jun 2020 13:50:29 +0000
Received: by mail-wr1-f67.google.com with SMTP id x6so17426447wrm.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Jun 2020 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uvwgW89KNJaCpkAay5Bmt5Q5u2ENn3zZzl6ZGX4sCzs=;
 b=QdtkN0Q9RhALxTt6SR7EAnfG+MxLms9iFM1XlfFaX0Xwax8Yy7wnlMt9Q4uqkWNiNO
 yQcijaXgdzVVThzSCn1F39bQPrgg8Epv3ZU/I9X2WPoqLaobrA/VXlhp7L5Wpo+mZEzk
 umMCiPHVf3iLmTUC9l6VPIRYd/3wlECWqnFKKO2yQ24XXVWUmu4KJaLZ9vLeNXXBX8qt
 Z1xEpquBVDkr2nAeHkeNe2k3DoSeeM5/eif9NWZvMF0cDrH9pAe6xOLbr33B5mP9goDa
 3WcenuwKEHCmcNsaARbkiGPI3ePRu8Y/5rcenAcFP0bd6IQzgXUrCS//aYArpnR4jmLH
 /2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvwgW89KNJaCpkAay5Bmt5Q5u2ENn3zZzl6ZGX4sCzs=;
 b=KJbAXI1KPWaucBPdADSqG1bHq7XNKd8NJlOzeetU34bUFuKugi4hB35z29ZCyKCkgF
 Rco6wOuk/SeViHZmPVn7jrfjkB21xU4t7RMTkEt6UuJ2jg4G8pN+0VMBPBjVAi4k6IY7
 JtOzP5XIZFImMg0lkmIpLczfUbBIv1AW2XrDFx9TbDJ/rFtCgTJ9b+J/M6XvzGYAqIcX
 hX2I6eeKDPYfHS7tcfCoueMl9+JWtqBjeUrZIM6kPubD+Z7Xnu2OySa6rGwfBaDk3RgU
 X+yrjD0Q9aEShMnM0+Wqq41tuA8FXZDNNiPK8w0Q5Wrmcrsb8Cm9nsW2gPw+LdBeoYDm
 w2AQ==
X-Gm-Message-State: AOAM53285zL0//QDLAECMyEkq6Uz79EGvwFZ+eI17xyrvhfruZjEsutC
 XDLt1Ald4eGnqE4oyZg3ezSOBw==
X-Google-Smtp-Source: ABdhPJwXhuwBVRp078X1AQ9dwW6AAdWmm8G4+q5L37eauA5bHgAS+mkxL5jmNO0JlGeaG6UMB4wowg==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr23168437wrq.420.1591624219092; 
 Mon, 08 Jun 2020 06:50:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h15sm22724547wrt.73.2020.06.08.06.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 06:50:18 -0700 (PDT)
Date: Mon, 8 Jun 2020 14:50:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200608135016.5pdxidpepjujqw6b@holly.lan>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
 <20200605142953.GP2750@hirez.programming.kicks-ass.net>
 <20200605144457.GD2948@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605144457.GD2948@hirez.programming.kicks-ass.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hw.info]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jiIAT-00DWSr-M2
Subject: Re: [Kgdb-bugreport] [RFC PATCH 0/4] kgdb: Honour the kprobe
 blacklist when setting breakpoints
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 05, 2020 at 04:44:57PM +0200, Peter Zijlstra wrote:
> On Fri, Jun 05, 2020 at 04:29:53PM +0200, Peter Zijlstra wrote:
> > On Fri, Jun 05, 2020 at 02:21:26PM +0100, Daniel Thompson wrote:
> > > kgdb has traditionally adopted a no safety rails approach to breakpoint
> > > placement. If the debugger is commanded to place a breakpoint at an
> > > address then it will do so even if that breakpoint results in kgdb
> > > becoming inoperable.
> > > 
> > > A stop-the-world debugger with memory peek/poke does intrinsically
> > > provide its operator with the means to hose their system in all manner
> > > of exciting ways (not least because stopping-the-world is already a DoS
> > > attack ;-) ) but the current no safety rail approach is not easy to
> > > defend, especially given kprobes provides us with plenty of machinery to
> > > mark parts of the kernel where breakpointing is discouraged.
> > > 
> > > This patchset introduces some safety rails by using the existing
> > > kprobes infrastructure. It does not cover all locations where
> > > breakpoints can cause trouble but it will definitely block off several
> > > avenues, including the architecture specific parts that are handled by
> > > arch_within_kprobe_blacklist().
> > > 
> > > This patch is an RFC because:
> > > 
> > > 1. My workstation is still chugging through the compile testing.
> > > 
> > > 2. Patch 4 needs more runtime testing.
> > > 
> > > 3. The code to extract the kprobe blacklist code (patch 4 again) needs
> > >    more review especially for its impact on arch specific code.
> > > 
> > > To be clear I do plan to do the detailed review of the kprobe blacklist
> > > stuff but would like to check the direction of travel first since the
> > > change is already surprisingly big and maybe there's a better way to
> > > organise things.
> > 
> > Thanks for doing these patches, esp 1-3 look very good to me.
> > 
> > I've taken the liberty to bounce the entire set to Masami-San, who is
> > the kprobes maintainer for comments as well.
> 
> OK, after having had a second look, one thing we can perhaps address
> with the last patch, or perhaps on top of that, is extending the
> kprobes_blacklist() with data regions.
> 
> Because these patches only exclude kgdb from setting breakpoints on
> code; data breakpoints do not match what we do with
> arch_build_bp_info().

Right, my patches will only affect the code paths where kgdb sets
software breakpoints.

In principle h/w breakpoints, whether they are code or data, should be
able to rely on hw_breakpoint_arch_parse() and any errors from the hw
breakpoint API will propagate into the kgdb core and do the right
thing.

In practice it looks like kgdb/x86/hw_breakpoint have plumbed together
in a manner that circumvents the parse (and therefore#
arch_build_bp_info() never runs). Rather the h/w/ break problem using
the kprobe blacklist I think we could just fix these code paths.

The following is 100% untested (not even compile) and I copied a line
or two from register_perf_hw_breakpoint() without checking what they
do ;-). Nevertheless I hope it gives a clear idea about what I am
talking about! If this was developed into a "real" patch then I think
dbg_release_bp_slot() should perhaps be replaced with a better API that
doesn't bypass the checks rather than solving everything in kgdb.c .


Daniel.


diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index c44fe7d8d9a4..64ac0ee9b55c 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -223,11 +223,12 @@ static void kgdb_correct_hw_break(void)
 		hw_breakpoint_restore();
 }
 
-static int hw_break_reserve_slot(int breakno)
+static int kgdb_register_hw_break(int breakno)
 {
 	int cpu;
 	int cnt = 0;
 	struct perf_event **pevent;
+        struct arch_hw_breakpoint hw = { };
 
 	if (dbg_is_early)
 		return 0;
@@ -237,6 +238,11 @@ static int hw_break_reserve_slot(int breakno)
 		pevent = per_cpu_ptr(breakinfo[breakno].pev, cpu);
 		if (dbg_reserve_bp_slot(*pevent))
 			goto fail;
+		if (hw_breakpoint_arch_parse(*pevent, &(*pevent)->attr, hw)) {
+			cnt++;
+			goto fail;
+		}
+		(*pevent)->hw.info = hw;
 	}
 
 	return 0;
@@ -361,7 +367,7 @@ kgdb_set_hw_break(unsigned long addr, int len, enum kgdb_bptype bptype)
 		return -1;
 	}
 	breakinfo[i].addr = addr;
-	if (hw_break_reserve_slot(i)) {
+	if (kgdb_register_hw_break(i)) {
 		breakinfo[i].addr = 0;
 		return -1;
 	}


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
