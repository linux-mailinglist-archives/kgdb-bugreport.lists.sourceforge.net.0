Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312B325E4A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 08:32:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFXbW-0005yo-Pi
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 07:32:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=t2GS=H4=linuxfoundation.org=gregkh@kernel.org>)
 id 1lFXbV-0005yE-8f
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 07:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P5PHiJdNJvSaVog57JoWS6h3CMhJEkJY/txRDKuNLho=; b=kvi3YqK5aT8kY1v+A9e3PysT7u
 KVDmhFHWQh5jUkaV8MT7UE2EcR/azF77MEEs+jXfWsGJBSgQpyte008iVEqrQz6vWYDnm0H6Y8R8J
 iXWwrRyNFqsUWfbuvUi3BrqERXcxpDlbb8zLV/o56gHlXtSEijPqPSzzJ5zm0mHWLcIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P5PHiJdNJvSaVog57JoWS6h3CMhJEkJY/txRDKuNLho=; b=m9nWG9kPeoGezKmGUZZ0G2gslu
 SCj5UIfd86A4a07t3QagyG27ExmsaFXuip30uMl80Znip1Vgoe60/VLRQRjHWGod2rHBjPCSfPzBL
 pQciX6xEYQ0K6DllZD7gj4aIm51mpWO3JIMxUdWLw/MbxXOdmCmerNitl4ygYvWm40g0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lFXbN-005xuG-Hg
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 07:32:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3766A64ED3;
 Fri, 26 Feb 2021 07:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614324702;
 bh=ND2aNeSDF+CdZU//MneX68fHcP77aarQea98G/sjog8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kyTVO/5zoV3mCcbKZbeXmldvDRSAWZfPiUe27bW63bx306jI3XR4sLsfLkzbdwxIX
 dShMl/9mAMELUcii6lq8l3MgeKRu5uZjzVAqUurR0Mz2a8GpaNMH6U2CvFQSaq4AoV
 hTeDK0LeCDH5mt+3MWxHjJtPd1gWo9nS+mh/+2sQ=
Date: Fri, 26 Feb 2021 08:31:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <YDij234n3KAxWuXf@kroah.com>
References: <20210224081652.587785-1-sumit.garg@linaro.org>
 <20210225155607.634snzzq3w62kpkn@maple.lan>
 <CAFA6WYMYDNk2S=7crfYsrbP7XONTA-ytEypoqeo1GTpxf8NhAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMYDNk2S=7crfYsrbP7XONTA-ytEypoqeo1GTpxf8NhAQ@mail.gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lFXbN-005xuG-Hg
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix to kill breakpoints on
 initmem after boot
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 qy15sije@cip.cs.fau.de, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Feb 26, 2021 at 12:32:07PM +0530, Sumit Garg wrote:
> + stable ML
> 
> On Thu, 25 Feb 2021 at 21:26, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Wed, Feb 24, 2021 at 01:46:52PM +0530, Sumit Garg wrote:
> > > Currently breakpoints in kernel .init.text section are not handled
> > > correctly while allowing to remove them even after corresponding pages
> > > have been freed.
> > >
> > > Fix it via killing .init.text section breakpoints just prior to initmem
> > > pages being freed.
> > >
> > > Suggested-by: Doug Anderson <dianders@chromium.org>
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > I saw Andrew has picked this one up. That's ok for me:
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > I already enriched kgdbtest to cover this (and they pass) so I guess
> > this is also:
> > Tested-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> 
> Thanks Daniel.
> 
> > BTW this is not Cc:ed to stable and I do wonder if it crosses the
> > threshold to be considered a fix rather than a feature. Normally I
> > consider adding safety rails for kgdb to be a new feature but, in this
> > case, the problem would easily ensnare an inexperienced developer who is
> > doing nothing more than debugging their own driver (assuming they
> > correctly marked their probe function as .init) so I think this weighs
> > in favour of being a fix.
> >
> 
> Makes sense, Cc:ed stable.


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
