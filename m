Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C7F1F6A15
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 Jun 2020 16:33:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jjOGL-00029q-QW
	for lists+kgdb-bugreport@lfdr.de; Thu, 11 Jun 2020 14:33:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jjOGK-00029P-SZ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 14:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pi9l9jRV1ZGjNyEOBE//QxW0cXJlApW1liZwwSNeTyk=; b=dAyRVctw8MQams5+H50ZenfH5J
 bklKT6U43C8nYqDiMXTIPy6F09GLHjo8SFj9cZSGbNFABQHV2mIAfgJ5fyeoj5uPEPtC/cBfk9lqx
 AoHsyGp7KaPf+dr+KoE0XtB+Wu8kp++3oBY/OkwekFEtMUF7Jfnjj0LGU+AkIX9Os/3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pi9l9jRV1ZGjNyEOBE//QxW0cXJlApW1liZwwSNeTyk=; b=GHCU4+SL1Re3Sf6IWdfZ0IrkPm
 WrO9zWHEZypf4pj3iRHudn51ni+eO9PfOsa6CQqbUk/fCEeFZoGj/EgdWs2vBUj5tSyOYCqGpARc5
 06gagck9wIqdSM2mb53NMdPey2On7gQ82IszE1gaQzzooLh22BCgYHhQpSvH3MOt+5wk=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjOGG-00GjaD-JX
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 14:33:00 +0000
Received: by mail-wm1-f66.google.com with SMTP id q25so5290604wmj.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 11 Jun 2020 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Pi9l9jRV1ZGjNyEOBE//QxW0cXJlApW1liZwwSNeTyk=;
 b=ZTqlfkb93KT/yNN/1Mzmjr77ZcsvDex++EjP1mbAOtttopJRmAB5U+KmgyldiGepdp
 U+jIWf7dzkiWB6U/RqJB4L1Zz8V36BcFM6O6Gc1vyzY+tIe1jyswltjGZunr8aR1WboW
 TBLBXnCxhzdWmJAN5CQhoBQF3kWxnE5mQqy6oXZly+SDtAX7DHdhLY+qNgTX7ZGDjBn3
 eCEG14eZxYbA3NJfl0I0JSVGKZHgcNHHC83Y9roqn6ZzEelYlQT3YXdIk0QEubCJj5MM
 TKMBVIo8ev6d9S9pFYGZIj6OxAqaw4+9PuF+5qmBiajJX3ojpQxnj943adrNUofm+Ri6
 wXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pi9l9jRV1ZGjNyEOBE//QxW0cXJlApW1liZwwSNeTyk=;
 b=kYs+TcArxIvOTElznjfs+cLPjnI05mNV7nTjQO8GxLzdb5WCDMu91qQkOdX7Ih1gFg
 WSkM9xrhOhpiqi4q9n7w72sSCgr8rEpZ48DJMq5QpPEi2UFeQu2ZTf3UPdD1RzUw0bRw
 nvTwYfoEqx+VsOm9Or00F1C+Zcov2HwY/kN2Z87G1fU004D8IJLSgH/ZO/rbf4JC8iaE
 bB+0EdTr7O/1wLh9nnJlvfCcW8zfSzFFuoPEb+/d4B1eiD4C6W9V6FmCDV0v6YrdBToS
 BtzIaUO48Ast4udQ9VeU8xvTlD59bRnw3PxVo//w992mnx8twxaHvwvByTBi9Zgfg5Cb
 WJOg==
X-Gm-Message-State: AOAM530INSQwLFTrp9iRXLnwsQbvrJNV/RlNuLvn+7Cu/cV3uMxk/wZo
 NKvuihdnaj3otCfU+ef+0LQ3cg==
X-Google-Smtp-Source: ABdhPJwkD/nii6gyKXo+P/17pv8qNbDSXx3d/bnB2jiZ7qUjhYSGDepjtS+BNmDtxxHjX5R1n/lGOg==
X-Received: by 2002:a7b:c951:: with SMTP id i17mr8139999wml.44.1591885962877; 
 Thu, 11 Jun 2020 07:32:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y37sm5884173wrd.55.2020.06.11.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:32:42 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:32:40 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20200611143240.u77kxdbhepaazx3j@holly.lan>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
 <20200605142953.GP2750@hirez.programming.kicks-ass.net>
 <20200611214209.bd8fcd290d745ae50d898e69@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611214209.bd8fcd290d745ae50d898e69@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjOGG-00GjaD-JX
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
Cc: pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jun 11, 2020 at 09:42:09PM +0900, Masami Hiramatsu wrote:
> On Fri, 5 Jun 2020 16:29:53 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
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
> Thanks Peter to Cc me.
> 
> Reusing kprobe blacklist is good to me as far as it doesn't expand it
> only for kgdb. For example, if a function which can cause a recursive
> trap issue only when the kgdb puts a breakpoint, it should be covered
> by kgdb blacklist, or we should make a "noinstr-list" including
> both :)

Recursion is what focuses the mind but I don't think we'd need
recursion for there to be problems.

For example taking a kprobe trap whilst executing the kgdb trap handler
(or vice versa) is already likely to be fragile and is almost certainly
untested on most or all architectures. Further if I understood Peter's
original nudge correctly then, in addition, x86 plans to explicitly
prohibit this anyway.

On other words I think there will only be one blacklist.


> Thus, Nack for PATCH 4/4, that seems a bit selfish change. If kgdb wants
> to use the "kprobes blacklist", we should make CONFIG_KGDB depending on
> CONFIG_KPROBES.

Some of the architectures currently have kgdb support but do not have
kprobes...


> Or, (as I pointed) we should make independent "noinstr-list"
> and use it from both.

This sounds like this wouldn't really be a functional change over
what I have proposed. More like augmenting it with a massive symbol
rename (and maybe a little bit of extra code movement in the headers
to give us linux/noinstr.h).

Taking my cues from things like set_fs() I originally decided to keep
away from such a big rename ;-) .

Personally I'm open to a rename. I could write PATCH 4/4 assuming a
rename will come (e.g. different naming for new files and Kconfig
options) and follow that with an automatically generated
rename patch (or patches).


Daniel.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
