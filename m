Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 485131F18F4
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Jun 2020 14:43:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jiH87-0000hD-3U
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Jun 2020 12:43:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jiH85-0000gz-Mb
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Jun 2020 12:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OnT205P+Q9ExcEEivUSebKDFNf0i4UfVrNiNXILSir4=; b=YYera2m7Gneh2k/FgR15C/hala
 Te7sd2fg+DlJkb13Mfjnwq9TPiPkMfO+rxrJwFBz/a5SvLF0zwkKyn0vkYHcTa7NBs4/ioirr19yE
 55LnQEp1gnDEO9Y69WgS8BTWz+JA2Isqi6/pv/G9jIz0YTlMBYsTSsKGNN+uGWp3sk9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OnT205P+Q9ExcEEivUSebKDFNf0i4UfVrNiNXILSir4=; b=Cg+0fAfYQS1w3zKfgVsLx/HVu/
 KwFPqYcDeOwGn1u7IDHsY3ujNlxY6MBE7BPmp+nzvMDmwP9t3b8H99HyjDcHFy+2d4oXdhZWnY8Zw
 Sv7GZgzKz0UudgPVkkNfADSlY4R1oortsGQJrCvIrQgNWYFg1p+G+tzOtEnLM+ASC6Qw=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jiH81-00DS92-9s
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Jun 2020 12:43:53 +0000
Received: by mail-wm1-f65.google.com with SMTP id r9so15177804wmh.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Jun 2020 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OnT205P+Q9ExcEEivUSebKDFNf0i4UfVrNiNXILSir4=;
 b=S1ULEvkPVLdl7+HUPl+/XXL5M1NFP/GaiAuNCbCi57rh3L6BKfVw6ceUIPW2qrC4UZ
 3duKjga+IN3TmxRo8schydvUJ3X3maD5P8eU2C9vbYcYlGhARdUAHSwXB37O046n7Ucw
 taGXyrZoNAwtnc/zKdtbW+83nurquibXu8b8TCjEaira/VpoOuakEA7Kn6QoPmmhiBIk
 73bqZaYgJbRIyva9gUbJG8IhhrNjiWdOgJkuJhEKelzcnGPwLa3XY9vYDtqd50diaNH/
 7E4wQmACp5f5AcRWKf9JTvuwzh+NNDp0QKe8XIe1gNveRK3+VJVX/NXRzzZHhH/h1nUe
 nbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OnT205P+Q9ExcEEivUSebKDFNf0i4UfVrNiNXILSir4=;
 b=tYj4L9JlQIsFoBwYZTyo8ySL/vVgW3bsFVnYW8lR1KofgRLji3j5Nogaz2kLppFn0H
 kYdHyIREmn761cbh8fgTzH3yCKjTYG615BkFSLq68FP+KhVVAiLV2j/2aTEoYOQw5fNt
 rEFWeAeq4Pv/43EPzFoYlR4G2lSDfGwU2SO5vbduv9Ct/p88wPkSRI1zL4WW6mZQPyej
 OdZz8nUGE4AUY/8KwBNDk1iVixLC+wZcFhHQUxSIsngDyXFxW9RgvJGbDE2vYjxABLaS
 FVEzx/8bCx5I9ShCikBxalg1xMp+VNRxgAr9gfMdyzfxU88Zu841ycqj4jU8rSR5Tzi0
 L0Dw==
X-Gm-Message-State: AOAM531TTlAY5l3mFY0NTz/JdNXpqTAGGg5Ea/JoTiRyFWfgZlGZgcTe
 6AomxUAESykHsoImRH6uRGrbIg==
X-Google-Smtp-Source: ABdhPJx+7QzV+Jtitmm3hlNM56KPb2eBH9iZ9cIJDY4H4CUVnxl+GEds1CPcDVPg+D3E5Mfdwdb4ZA==
X-Received: by 2002:a1c:6006:: with SMTP id u6mr15373622wmb.39.1591620215530; 
 Mon, 08 Jun 2020 05:43:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l17sm23442506wrq.17.2020.06.08.05.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:43:34 -0700 (PDT)
Date: Mon, 8 Jun 2020 13:43:32 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200608124332.mzamwmdowu6dlh6k@holly.lan>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
 <20200605142953.GP2750@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605142953.GP2750@hirez.programming.kicks-ass.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jiH81-00DS92-9s
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

On Fri, Jun 05, 2020 at 04:29:53PM +0200, Peter Zijlstra wrote:
> On Fri, Jun 05, 2020 at 02:21:26PM +0100, Daniel Thompson wrote:
> > kgdb has traditionally adopted a no safety rails approach to breakpoint
> > placement. If the debugger is commanded to place a breakpoint at an
> > address then it will do so even if that breakpoint results in kgdb
> > becoming inoperable.
> > 
> > A stop-the-world debugger with memory peek/poke does intrinsically
> > provide its operator with the means to hose their system in all manner
> > of exciting ways (not least because stopping-the-world is already a DoS
> > attack ;-) ) but the current no safety rail approach is not easy to
> > defend, especially given kprobes provides us with plenty of machinery to
> > mark parts of the kernel where breakpointing is discouraged.
> > 
> > This patchset introduces some safety rails by using the existing
> > kprobes infrastructure. It does not cover all locations where
> > breakpoints can cause trouble but it will definitely block off several
> > avenues, including the architecture specific parts that are handled by
> > arch_within_kprobe_blacklist().
> > 
> > This patch is an RFC because:
> > 
> > 1. My workstation is still chugging through the compile testing.
> > 
> > 2. Patch 4 needs more runtime testing.
> > 
> > 3. The code to extract the kprobe blacklist code (patch 4 again) needs
> >    more review especially for its impact on arch specific code.
> > 
> > To be clear I do plan to do the detailed review of the kprobe blacklist
> > stuff but would like to check the direction of travel first since the
> > change is already surprisingly big and maybe there's a better way to
> > organise things.
> 
> Thanks for doing these patches, esp 1-3 look very good to me.
> 
> I've taken the liberty to bounce the entire set to Masami-San, who is
> the kprobes maintainer for comments as well.

Not a liberty... leaving out Masami-san was an oversight on my part.
Thanks for connecting!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
