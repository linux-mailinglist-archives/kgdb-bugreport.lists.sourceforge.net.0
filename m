Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF4B0BF
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 Apr 2019 00:27:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hK9JH-0006Qb-6q
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Apr 2019 22:27:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hK9JF-0006QU-DF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Apr 2019 22:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hezVdxYa7xMFmmsHtJCJ4akvoRKAs160hgitrpcp5Wo=; b=Yv9RCA5g6ePYPLozGhhl6eTfAx
 h1lmaJth5Oucyz49uwaMQVUiAtugKeIydcsyOdMs1gkqwvLSWppTG6lPJ6EFUlDXEV4P+TjR/PohJ
 WQPCqle4+iw3+AOmliv0o7bX6+abIyLXUO20IXkpAWOsPgc4wI+PdDLz5k207ybQzRc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hezVdxYa7xMFmmsHtJCJ4akvoRKAs160hgitrpcp5Wo=; b=UwqQnrt15lB/QrXiNNq1yW3eg0
 +XXOic0iCyKGiVDcvNgbW6pGxkSaLuWcUVJKG+JauXD4TN+q+87t4WnedZjOjg3X1rHNHr6Aaqy9l
 j94jrIu7m8kvxwizWyEYR3ZW8cBJZXt+mlYMzCijcgFIY62RTX+K7UjzcnjkWGmJXT04=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hK9JE-00EOk5-1O
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Apr 2019 22:27:09 +0000
Received: by mail-vs1-f68.google.com with SMTP id n17so2857919vsr.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Apr 2019 15:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hezVdxYa7xMFmmsHtJCJ4akvoRKAs160hgitrpcp5Wo=;
 b=lNRQD5UNUI4iKwsnvwfrvRz0oUakOCrhoZhLLw2kCVKIzeR2Ilhz6io4KhWo1/GKw+
 pfsAUJd+rZeC9IaNo7TnD/eDa1NUWCA3ikDm7wD6XscWhwK7mvVtqY5UO4jE17KjcVRF
 ggxCoAR1oyQO63WeTNk0e5foereFgXiglQAYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hezVdxYa7xMFmmsHtJCJ4akvoRKAs160hgitrpcp5Wo=;
 b=OBItEThbVQXz+Cr3TH6GfszfhI50IHdR8WC15SX+XlE0NU5fjBW4lUBTgWi04+BFIT
 4Jv0Nm0KPvvt+WcXNan6+Bun0tdgcIxwm278jsCLZXExKYi4LfjxSwQqJxZpY7OUiWfv
 JmrTzmsJ2BDw9UMRBwGM/Z3IFUED4TzgPCeoe551gvWOSM7bDorQPQmZcEOKB9CzknCv
 mb9ebiinBPBuqY1EnxnLhaEmi0nnUCaI2S9Iz/AkgH+5E/2nPDrNhHoKO6nUF4xL3CEG
 Pk4PHgnsauIABmXtWia2+3UVMqnOITgXoY2lM+rTkOJGl0xdNAvkYRCXK1+ql4c0OJk3
 d6/Q==
X-Gm-Message-State: APjAAAW0JopWGnpl/XGtmtFrHn9Lqte8Vute04x7gltGTuQvYENbGadg
 Z29CxdlJTUFFEqsC7bIWZFJgw+G4ic8=
X-Google-Smtp-Source: APXvYqwfn+g/88xxADHc61vgQez0lsj6b2qDXsl0jATAGcEy6e43exQt3ejXabsHeoVqEfp8JhPrpQ==
X-Received: by 2002:a67:dd0f:: with SMTP id y15mr26409531vsj.195.1556317621918; 
 Fri, 26 Apr 2019 15:27:01 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id 1sm5209391uax.3.2019.04.26.15.27.00
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 15:27:01 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id e2so2803344vsc.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Apr 2019 15:27:00 -0700 (PDT)
X-Received: by 2002:a67:7b53:: with SMTP id w80mr26630879vsc.144.1556317619648; 
 Fri, 26 Apr 2019 15:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190319171206.97107-1-dianders@chromium.org>
In-Reply-To: <20190319171206.97107-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Apr 2019 15:26:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbHa3GrgVMAAcf2e0W5t1gc--Z2t0vWa9RhSo32w12zA@mail.gmail.com>
Message-ID: <CAD=FV=XbHa3GrgVMAAcf2e0W5t1gc--Z2t0vWa9RhSo32w12zA@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.2 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hK9JE-00EOk5-1O
Subject: Re: [Kgdb-bugreport] [PATCH v6 1/3] tracing: kdb: The skip_lines
 parameter should have been skip_entries
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Brian Norris <briannorris@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Mar 19, 2019 at 10:12 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The things skipped by kdb's "ftdump" command when you pass it a
> parameter has always been entries, not lines.  The difference usually
> doesn't matter but when the trace buffer has multi-line entries (like
> a stack dump) it can matter.
>
> Let's fix this both in the help text for ftdump and also in the local
> variable names.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Changes in v6: None
> Changes in v5:
> - Add Daniel Thompson Ack.
>
> Changes in v4:
> - skip_lines => skip_entries new for v4.
>
> Changes in v3: None
>
>  kernel/trace/trace_kdb.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Steven: do you know if/when you plan to take this series?  There's no
crazy hurry and if you like I can sent a calendar alert to remember to
ping you after 5.1 is released so you can land this in a "for 5.3"
queue.  Just let me know.  :-)

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
