Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5755D1F7712
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 12 Jun 2020 13:05:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jjhUn-0000UP-0U
	for lists+kgdb-bugreport@lfdr.de; Fri, 12 Jun 2020 11:05:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jjhUl-0000U8-8x
 for kgdb-bugreport@lists.sourceforge.net; Fri, 12 Jun 2020 11:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4En2rY+Trq8fwrO7NokOMzjPoiMghC3ekaWth9n3B6Q=; b=AsYiNCtxaknKrH3TGHm+dzlo2L
 aEvjwDM0ZeLHYbyvQWx32IJ6f/cIbLgSYGCfHr3UxeBEw2B4wmzk/Q6Xac5WDPvHHKXJSB9/PA28Q
 LCdZeseRweSKg+9vzokZITUwOjamDBNkEWHjJ7I6fkC1QydfR510Qp0U2lnPHqfvnlk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4En2rY+Trq8fwrO7NokOMzjPoiMghC3ekaWth9n3B6Q=; b=kwrHHBdtyvua0uVgdLGU727feF
 az8f17qqvDNihZ+vI4HnOJTwinkY3Dr6OlqLq1QjnVaMF7fONEGwjiwqpU4LP8PZHi4xGl+GXUKMj
 BctfpykuHWHDRs95uvnJWEm0TSrgM8J4Ztf6wcHmF9uWqBB9fNxTGTQFIERlqoinjfFQ=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjhUf-0033Z2-Pv
 for kgdb-bugreport@lists.sourceforge.net; Fri, 12 Jun 2020 11:05:11 +0000
Received: by mail-wr1-f67.google.com with SMTP id x13so9306448wrv.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 12 Jun 2020 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4En2rY+Trq8fwrO7NokOMzjPoiMghC3ekaWth9n3B6Q=;
 b=JPNXJErKT/cjpj8ltHI1jaCXDNxFs5XtEaWpt77hEMm46kC6UZQN/GZdxE88a2wa76
 6t4dZN+bAFmu/Igf13onzzf7sJJqW7DBucS9dWWUYI/RK0DBmfGs83Yg6DY3jkjwqn+B
 0VR1ngkS0zgLw+Tqzl9rqRYjiRAAMoAA/R8emWwWCdshumWIBtVKLrug/ho/bqRFrSzk
 0hPa8zsZADANpHL7WVx3JGA8DLEmzaHaOpyrdP5WpF3YicINFgq0e6LazvPzzWVpMRON
 hdidtG49V7SMb0CT7BHcmNaErTEfxCZMvDFYADfi2ShrkNKzmEbtmNw9pY64tdkh0mYY
 Cntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4En2rY+Trq8fwrO7NokOMzjPoiMghC3ekaWth9n3B6Q=;
 b=Kbs6LzxoZT12gnni1JCDH8mpfjkl0uhhwpoYujWHlZYhFB3g8/tKhtCd9Z/hlzCV/0
 J4hRyo6Hqj2ugEF7gXiEZN0Ka96LnZNFHqPjy5injx6DVPjqPZ+EzHhW6nneXcsRuNT4
 z5qldJGp8yEUydHk8n6scffS7CPeZXWDOF9ez3wmfx2u3SKU1NsottfyPe+Qsc0x4eUf
 FtpAoPwGz9QN98GAOKMqZISBaqDIYepq2SkfCmnTpbqFGh5uN5VGiAKp5REQOc6vzXbD
 Tk2yIBuSMb5hAhSccAxDNGi7s6dah461Y9J/IEbiR/uzOox9sSQmeRo6/snB8zy6B9ai
 9NKg==
X-Gm-Message-State: AOAM533uwd6bIqeOfcA98SRvDZrdpgtmxNEH6Xtm9goNE9DUA0zsLsWh
 c4YnDBzwCfzrZ+OupZxqKuddrA==
X-Google-Smtp-Source: ABdhPJzK3S/OPHk7E1CTtQcB7tS2Juv2s9mmyUfyUs1f+ieL5Bvns2LzCG1smBoHmFViuB1ZYkouOA==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr14045380wru.422.1591959899288; 
 Fri, 12 Jun 2020 04:04:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s8sm9455155wrm.96.2020.06.12.04.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 04:04:58 -0700 (PDT)
Date: Fri, 12 Jun 2020 12:04:56 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20200612110456.ysfee4g46gv7lucl@holly.lan>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
 <20200605142953.GP2750@hirez.programming.kicks-ass.net>
 <20200611214209.bd8fcd290d745ae50d898e69@kernel.org>
 <20200611143240.u77kxdbhepaazx3j@holly.lan>
 <20200612191349.9774d101681b9f8e7ada0200@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612191349.9774d101681b9f8e7ada0200@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjhUf-0033Z2-Pv
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

On Fri, Jun 12, 2020 at 07:13:49PM +0900, Masami Hiramatsu wrote:
> On Thu, 11 Jun 2020 15:32:40 +0100
> Daniel Thompson <daniel.thompson@linaro.org> wrote:
> 
> > On Thu, Jun 11, 2020 at 09:42:09PM +0900, Masami Hiramatsu wrote:
> > > On Fri, 5 Jun 2020 16:29:53 +0200
> > > Peter Zijlstra <peterz@infradead.org> wrote:
> > > 
> > > > On Fri, Jun 05, 2020 at 02:21:26PM +0100, Daniel Thompson wrote:
> > > > > kgdb has traditionally adopted a no safety rails approach to breakpoint
> > > > > placement. If the debugger is commanded to place a breakpoint at an
> > > > > address then it will do so even if that breakpoint results in kgdb
> > > > > becoming inoperable.
> > > > > 
> > > > > A stop-the-world debugger with memory peek/poke does intrinsically
> > > > > provide its operator with the means to hose their system in all manner
> > > > > of exciting ways (not least because stopping-the-world is already a DoS
> > > > > attack ;-) ) but the current no safety rail approach is not easy to
> > > > > defend, especially given kprobes provides us with plenty of machinery to
> > > > > mark parts of the kernel where breakpointing is discouraged.
> > > > > 
> > > > > This patchset introduces some safety rails by using the existing
> > > > > kprobes infrastructure. It does not cover all locations where
> > > > > breakpoints can cause trouble but it will definitely block off several
> > > > > avenues, including the architecture specific parts that are handled by
> > > > > arch_within_kprobe_blacklist().
> > > > > 
> > > > > This patch is an RFC because:
> > > > > 
> > > > > 1. My workstation is still chugging through the compile testing.
> > > > > 
> > > > > 2. Patch 4 needs more runtime testing.
> > > > > 
> > > > > 3. The code to extract the kprobe blacklist code (patch 4 again) needs
> > > > >    more review especially for its impact on arch specific code.
> > > > > 
> > > > > To be clear I do plan to do the detailed review of the kprobe blacklist
> > > > > stuff but would like to check the direction of travel first since the
> > > > > change is already surprisingly big and maybe there's a better way to
> > > > > organise things.
> > > > 
> > > > Thanks for doing these patches, esp 1-3 look very good to me.
> > > > 
> > > > I've taken the liberty to bounce the entire set to Masami-San, who is
> > > > the kprobes maintainer for comments as well.
> > > 
> > > Thanks Peter to Cc me.
> > > 
> > > Reusing kprobe blacklist is good to me as far as it doesn't expand it
> > > only for kgdb. For example, if a function which can cause a recursive
> > > trap issue only when the kgdb puts a breakpoint, it should be covered
> > > by kgdb blacklist, or we should make a "noinstr-list" including
> > > both :)
> > 
> > Recursion is what focuses the mind but I don't think we'd need
> > recursion for there to be problems.
> > 
> > For example taking a kprobe trap whilst executing the kgdb trap handler
> > (or vice versa) is already likely to be fragile and is almost certainly
> > untested on most or all architectures.
> 
> Ah, OK. Actually, on x86 that is not a problem (it can handle recursive int3
> if software handles it correctly), but other arch may not accept it.
> Hmm, then using NOKPROBE_SYMBOL() is reasonable.
> 
> > Further if I understood Peter's
> > original nudge correctly then, in addition, x86 plans to explicitly
> > prohibit this anyway.
> > 
> > On other words I think there will only be one blacklist.
> 
> Agreed.
> 
> > > Thus, Nack for PATCH 4/4, that seems a bit selfish change. If kgdb wants
> > > to use the "kprobes blacklist", we should make CONFIG_KGDB depending on
> > > CONFIG_KPROBES.
> > 
> > Some of the architectures currently have kgdb support but do not have
> > kprobes...
> 
> "depends on KPROBES if HAVE_KPROBES" ? :-)

I'm personally be OK with something like:

#ifndef CONFIG_KGDB_ALLOW_UNSAFE_BREAKPOINTS
  if (within_kprobe_blacklist())
    ...
#endif

And then setup Kconfig so that KGDB_ALLOW_UNSAFE_BREAKPOINTS
defaults to n and add a extra check to put a warning in dmesg
that breakpoints are disabled.


> (Anyway, it is a good chance to port kprobe on such arch...)

I like kprobes very much... but not quite enough to want to
implement it on architectures I don't use ;-).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
