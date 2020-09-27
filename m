Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2371C27A437
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 27 Sep 2020 23:15:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kMe1I-0003BS-Po
	for lists+kgdb-bugreport@lfdr.de; Sun, 27 Sep 2020 21:15:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kMe1H-0003BD-9B
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wo4yLXRXGXzvWNduXQeTvSnGkItHS2XwJ0Qpb3pIebI=; b=Xfj2KLaAmBA7GCJYUnveuhurP4
 xzZYz7wD7TVJv8EAdTlWz57gVtdqEBVqfJ2/3bTp+26tKezX1FLgl30vlgjSDqYufRl/saIVHy0kM
 CuUzMYqVgNpxxQUrnD0a0FTFOZ8OTzZyYnx//dav0T0aBlF+hAvYBvkvx4pqsb8/mta4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wo4yLXRXGXzvWNduXQeTvSnGkItHS2XwJ0Qpb3pIebI=; b=Z0JDDM2JIRQpEp9USwcQL1TdLz
 xMgkk4Cshpw2ETaWqyvqGIF4qIx8IhgcjHRFsp5+olB9rCSQpSATxOMziBoiqtzUaj316aKK1xVnc
 TeGFNGQXYkHLcdobTcV07l08ZjaEAxUTpD+1BtTi9Yr4H17gQGVOrYcn8RWbOK0gsEVw=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kMe13-00Ah3m-TN
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:15:43 +0000
Received: by mail-wm1-f67.google.com with SMTP id y15so4934580wmi.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 27 Sep 2020 14:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Wo4yLXRXGXzvWNduXQeTvSnGkItHS2XwJ0Qpb3pIebI=;
 b=PgK5dB0EfwyESJ76pPs8H8HZ8y2jTGBuxHe4uughIzKTKEYDK5K0aDlVXaM9Go0lLv
 HZJKsSAjwDlad/w+aTw9VQjCpAH+zUi66wG0xOdSZ5NYBOxxwQr1kKMZ36+g+tpADcTN
 1UuW4XkcYBDjEQvVzq5d/GpnX+yKBA+DradgPXcKW/CpfMnjR7RuUe+xq1hFwHY92T/j
 9U28piAZGkJf+2b1TJUOZATdigvwym+uE0p4g6jP3UYVNWwLWunrBkdLfqgxeIMvuI/d
 vxdC4oUwP2BVl4T+DU/wGbCarpqek5EaA1WDd2QZ6EknGltY9h7Q0ZdnachlhuoINFgu
 OKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wo4yLXRXGXzvWNduXQeTvSnGkItHS2XwJ0Qpb3pIebI=;
 b=cI5iKyyvmbRd8vYSDK2uRJtEP/x5Q2JuUFzVM+JepeF8vddW75RMoYL1oo5VhKADuJ
 Mn3ICdF85XD2r33sErRKfoCTkAkhIzI8xm7+4KWOeY1D2qyv/jVNMVYBrcljWig/KgMT
 l0wLX+/TWE39/m9DEvfyfS9hozMbLRvEBnBuhB5dzZtdw0JSTuijqUbC/E7pVQ+jdXZw
 s8oreWazVP0aorrEzzUdA3DMJLYIxTe+QfwH6kqyvcnYuC9WnIKZL1AAokOLKlLQ2Ift
 97Knj3YNJN1oqK5uFNnuMmTueI6Cw32HxAdvSsY/xGE6I1C8Xh7Kbm1RKVGQBLaSA6Ol
 CDDQ==
X-Gm-Message-State: AOAM532KRCgpbG/X47O7ZU/lzg0ho9d9S4JLyv6HzKb+0iHo8tZp2eUi
 LOAu6nvF9IlkKhjPOfh1lggCSQ==
X-Google-Smtp-Source: ABdhPJxZTZglZnvISi46LyC0c5QCR6qmfidmxXPZPTk7a/ypsDTNNHQeo9gTmNUMQz0CipMy10a7Rw==
X-Received: by 2002:a1c:6145:: with SMTP id v66mr8647508wmb.171.1601241316210; 
 Sun, 27 Sep 2020 14:15:16 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id b84sm7220960wmd.0.2020.09.27.14.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 14:15:15 -0700 (PDT)
Date: Sun, 27 Sep 2020 22:15:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200927211513.3crdqbo4lr5xno7j@holly.lan>
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
 <20200914130143.1322802-3-daniel.thompson@linaro.org>
 <CAD=FV=XTgNxVLwytSY1wmCj7Dex3cWGVMA+Rkpp9gb1UN5CU_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XTgNxVLwytSY1wmCj7Dex3cWGVMA+Rkpp9gb1UN5CU_A@mail.gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kMe13-00Ah3m-TN
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/3] kgdb: Add NOKPROBE labels on
 the trap handler functions
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
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Sep 14, 2020 at 05:14:22PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 14, 2020 at 6:02 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > Currently kgdb honours the kprobe blocklist but doesn't place its own
> > trap handling code on the list. Add labels to discourage attempting to
> > use kgdb to debug itself.
> >
> > Not every functions that executes from the trap handler needs to be
> > marked up: relatively early in the trap handler execution (just after
> > we bring the other CPUs to a halt) all breakpoints are replaced with
> > the original opcodes. This patch marks up code in the debug_core that
> > executes between trap entry and the breakpoints being deactivated
> > and, also, code that executes between breakpoint activation and trap
> > exit.
> 
> Other functions that seem to be missing from a quick skim:
> * kgdb_io_ready()
> * kgdb_roundup_cpus()
> * kgdb_call_nmi_hook()

I've grabbed those (and a one or two extras after paying better attention
to the entry logic).

> I'm not confident in my ability to spot every code path, though, so
> I'm not sure at what point we stop looking.  I only spent a few
> minutes and, if important, I could dig more.  Did you have any chance
> to see if there was any way to have a magic linker script just add
> this to everything under "kernel/debug" or something like that where
> we just use a heavier hammer to whack a whole bunch?

I think one could play games with linker sections but it would involve
adding extra infrastructure for the kprobe blocklist. I'm not convinced
that is worth the effort whilst there are acknowledged (and bigger) gaps
elsewhere.

> In general any extra annotation here is better than no annotation, I
> suppose.  ...so if you just want to commit what you have (maybe with
> the above 3 extra functions) then I suppose it'd be fine.

This wasn't quite confident enough for me to convert into an Acked-by:
but I plan to pull v4 into -next very shortly after posting it (since
everything else is agreed).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
