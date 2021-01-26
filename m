Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A003039BF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Jan 2021 11:04:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4LCf-0001Pk-It
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 Jan 2021 10:04:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l4LCe-0001PK-58
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 Jan 2021 10:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nrlm7ICKU6kGyPPM0BW3kHj+xG4zgJ9Mx69cef6OUAM=; b=k3WxCNPAfPYGIU1rhMTKYMAXpL
 HEF1hnzirZbNggG8cNd8wF8Sjgn/iZSzfP3vWBef1RSM6a1K0Mqikccra6knXdx5b8vDu/mWEZKUZ
 PfVdm38a0xUwkIXdhZZOQUUkS8jBN9Cn1nZhZ4kyhE8fbcRfA1u6nhLcJ+l+zIxR8dy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nrlm7ICKU6kGyPPM0BW3kHj+xG4zgJ9Mx69cef6OUAM=; b=hlfSaCCVy2tnN1hI9VuyEK13Gz
 H/SmYBtfxCUfYom7wT49uSG2XNN9pg9jO8j2sarTEsvXNDz2l4nRi8W50z/hb4HLkzpuobvM3T57K
 2Z4qtLFGnDNJQr0zlDxOxHgMaiFM/HpkC1/SZsse00W/caW0XLDfSij7qq1V66kTdBwM=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4LCU-006EsS-Vp
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 Jan 2021 10:04:04 +0000
Received: by mail-wr1-f54.google.com with SMTP id v15so15766335wrx.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 Jan 2021 02:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nrlm7ICKU6kGyPPM0BW3kHj+xG4zgJ9Mx69cef6OUAM=;
 b=gFwf/uz8h7CChxKL8gJzaPP4J59OmpoLNI9YE5pWgV/KV2ksxM5yC58bpnnhIeZWoX
 QK5o9rIS5dkZRd8eTsVoOjGKAbEy5Wp43nAPkqkzHL5BwAHbQ4X5fFfmq6zA97nnqv3y
 nPSwBCVMSvASLJAHlRuUHG60lP0We5UYikGcwMLYyRYP3re+Ehdnqt189eBbT/uOInBl
 FAb2foqV4LLqkf8euEH80vY9Vhvxei8t5lbDDAxKv9RrCVC/eFq9DdVHQRRXyDd3LG32
 /OQ0aT7nIkxn+Xg9++NJj+QPmMMpW6x358837TYjbNCScpdEVD62OLO6weBzsZLAxxSC
 7bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nrlm7ICKU6kGyPPM0BW3kHj+xG4zgJ9Mx69cef6OUAM=;
 b=sAl98nNCLtbeMbH3nYlvuKswV+jhcfQLvr5Ldzdo3Eopb4O8OaXWV3pC6WBnHYbWPD
 C23RrmtDiouO7CQssjUgJ5tz3atQSCMsW+R+Bbic6ZpbaU6VfjlZnW2fLetiB9wXDciZ
 QyMefxQgt1Cn9CnvsFDDZnCX9CUpbVBmJtkY+WKqZgPDpW4gkJ/oI4xuft1b+Rhj/gnW
 TavhJhiD6PtBrASA9kx1fj34ByQV91dHQM5SUna2ssKScJ4RpMJqshUPv2UeYXVGISa/
 GTlEtzy7TtIVDi97umRYMDabxrRIGtORmxZJcRwszfLf0VNWrhWwYN8sIa0PzlMj5Yvv
 9pYw==
X-Gm-Message-State: AOAM533zEelIwWl44jk1PpsRmIqIvJCf1fE05CCJcXsbpc9H+uBh57zo
 7Rzvfaop+HA1YB1WcSaHeB7jcA==
X-Google-Smtp-Source: ABdhPJy4NXxomgPFRs+1lYGxgVBnjwnBcLuU7mg5HIhMpv1nNwSxLc66lka8tzRv8prt8b/oNxargQ==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr5114792wrt.267.1611655421431; 
 Tue, 26 Jan 2021 02:03:41 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w7sm8798358wru.56.2021.01.26.02.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 02:03:40 -0800 (PST)
Date: Tue, 26 Jan 2021 10:03:39 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20210126100339.3izssu5kwjdusyfa@maple.lan>
References: <1611400441-7178-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=V6iEr5Xj53hvrQK+48xGm=s_GYQuyD_vgMM3Zknw5yOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V6iEr5Xj53hvrQK+48xGm=s_GYQuyD_vgMM3Zknw5yOw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4LCU-006EsS-Vp
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: kdb_support: replace function
 name by %s
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
Cc: Stephen Zhang <stephenzhangzsd@gmail.com>,
 kgdb-bugreport@lists.sourceforge.net,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 25, 2021 at 09:55:58AM -0800, Doug Anderson wrote:
> On Sat, Jan 23, 2021 at 3:14 AM Stephen Zhang <stephenzhangzsd@gmail.com> wrote:
> >
> > Better to replace function name by %s in case of changes.
> >
> > Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>
> > ---
> >  kernel/debug/kdb/kdb_support.c | 32 ++++++++++++++++----------------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> > index 6226502..7a536fc 100644
> > --- a/kernel/debug/kdb/kdb_support.c
> > +++ b/kernel/debug/kdb/kdb_support.c
> > @@ -40,19 +40,19 @@
> >  int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
> >  {
> >         if (KDB_DEBUG(AR))
> > -               kdb_printf("kdbgetsymval: symname=%s, symtab=%px\n", symname,
> > +               kdb_printf("%s: symname=%s, symtab=%px\n", __func__, symname,
> 
> Given the common pattern:
> 
> if (KDB_DEBUG(AR))
>   kdb_printf(...)
> 
> I wonder if we could improve this to this (untested):
> 
> #define kdb_ardbg_printf(format, ...) \
>   do { \
>     if (KDB_DEBUG(AR)) \
>       kdb_printf("%s: " format, __func__, __VA_ARGS__); \
>   } while (0)
> 
> Then the above just becomes:
> 
> kdb_ardbg_printf("symname=%s, symtab=%px\n", symname,

I'd prefer this to be:

  kdb_dbg_printf(AR, "symname=%s, symtab=%px\n", symname

That way the other examples of the if (KDB_DEBUG(xxx)) kdb_printf(...)
pattern could adopt the same macro.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
