Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B66342368
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 19 Mar 2021 18:36:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lNJ2o-0003hc-0v
	for lists+kgdb-bugreport@lfdr.de; Fri, 19 Mar 2021 17:36:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daniel.thompson@linaro.org>) id 1lNJ2D-0003gw-Df
 for kgdb-bugreport@lists.sourceforge.net; Fri, 19 Mar 2021 17:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kB3wMaglIcLKf7F3UpV4MdrlJMCKGqUAoltQ+BMHDS4=; b=R9dwmTAsoBk26ivVrYB1yC9HxI
 xCTxgOB9pz4WWrVj1zTXwzZAu4ZZhRMpssF0/4ilZsTcLbpVJe1DOYkKZn6H2HK8lWMoK8nsT66Ku
 RzfnrU4uasFY3I27dL1dOrqDqTlTraSk5wo5xhvg4LQzwRV3DHnwRtTJsDM6lN0qt5U4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kB3wMaglIcLKf7F3UpV4MdrlJMCKGqUAoltQ+BMHDS4=; b=Kd1aufTstBqC1oQjY820CKIlub
 GXWfnW4dnfG7mPNcfNIvwnPPSp3Qus/mROYOl5sdvHUDHGyc1NdKTxpnoOXU6/iobFmb7qp+5Cgoa
 34hp/MggoLCARfocKUVcuyVsFmVAv3HWh5frDn13mAHhy1AEg7fXQZatK1ZLguk/tzTs=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lNJ26-002YNy-C5
 for kgdb-bugreport@lists.sourceforge.net; Fri, 19 Mar 2021 17:35:41 +0000
Received: by mail-ed1-f47.google.com with SMTP id x21so11728424eds.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 Mar 2021 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kB3wMaglIcLKf7F3UpV4MdrlJMCKGqUAoltQ+BMHDS4=;
 b=fVDh6jF9M+OoMm38E3hF9oj+VaTCDTkwIuMTVvtW62vsnZBU64+pnsGfdeR6RAFc3G
 Gp4WCY0sv8RpKuzn6kNo0J+b8LBjQmMTJREDnChdN4txdIG9Gr4WMVJjRJOdYUm87R+P
 o7xHPoICgwzXwuq4rGkn9jTPrEVGxU3fLzuS8zrK8BKGpnJV3oCpcMLG+PHoghQcHZdR
 beS7xJ93uR4bvJBL9yFgEZ9YqSFXl138E98qHkr29stk0repAEuIPxZyhGq7IDJ9WOfZ
 VBtXozpdy2DSJD4fJVVsWLldsCCkH840iTNLg0bGvowosgBpMyiG3WcYL7Uyhj4HvnQd
 Cj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kB3wMaglIcLKf7F3UpV4MdrlJMCKGqUAoltQ+BMHDS4=;
 b=Y+4xuUyHjD5mFiZYUPBJQtAVNDuwX2zdTPfXi6wIzsEpTn94+FAqf4GcL0PbpiJlrq
 N8bwwVQThG/kxxrY7qm7dJpqoaEPAALckxF4rGpJLR+Mh+omuKoYFzmNTlUDsZffEVXJ
 sb5ILmEHMZQTXMgUin7hG1NSY2a95kAwzMLIV+s8oXTm6ovN3Ik+KDnANmNsG+3PqkAZ
 xIJA3w6SKoogXo8T96NyrfvGlDDhhJTWJxC0cJuEodLtyyI3hmNdNtMiOFNR7f7SSYJ3
 wgyxurIhyqHgQZ5SYUu5g/aC26wKQhPPkc9eCqxoZCDjUSnC0FZHBXU039Nj0COo3LSr
 MoVA==
X-Gm-Message-State: AOAM531E9dWjlgP0lWrRHGM/jcj0UbRMgWcAls0fn/SLJMam7tkQQcTz
 t+vrxs3CY5a89q3JmM+1UwLKxA==
X-Google-Smtp-Source: ABdhPJxTf/q2emE1qW05NY4RWOpvIh8CxujaPSro6L/Lm+yzo3uXQEBZ/HVDObejbA8Txnc+gGkqzA==
X-Received: by 2002:aa7:d792:: with SMTP id s18mr10817100edq.176.1616175327819; 
 Fri, 19 Mar 2021 10:35:27 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id oy8sm4018291ejb.58.2021.03.19.10.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:35:27 -0700 (PDT)
Date: Fri, 19 Mar 2021 17:35:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210319173525.m5uagzthzzmtuldy@maple.lan>
References: <20210226095306.1236539-1-sumit.garg@linaro.org>
 <20210226105934.gmppt6kubfadv4uf@maple.lan>
 <CAFA6WYPXCKSYBH8Tapf_yg-jS7G0sH0Dmi27s6hutUMtSE39-Q@mail.gmail.com>
 <20210226173727.dqa5uytqwbll6omo@maple.lan>
 <CAFA6WYO0AHJmsGVQr0LPd8p4TS-3S=S_3OnzFS=q2R5p5FiXSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYO0AHJmsGVQr0LPd8p4TS-3S=S_3OnzFS=q2R5p5FiXSA@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lNJ26-002YNy-C5
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Get rid of custom debug heap
 allocator
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Mar 01, 2021 at 11:33:00AM +0530, Sumit Garg wrote:
> On Fri, 26 Feb 2021 at 23:07, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, Feb 26, 2021 at 06:12:13PM +0530, Sumit Garg wrote:
> > > On Fri, 26 Feb 2021 at 16:29, Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > >
> > > > On Fri, Feb 26, 2021 at 03:23:06PM +0530, Sumit Garg wrote:
> > > > > Currently the only user for debug heap is kdbnearsym() which can be
> > > > > modified to rather ask the caller to supply a buffer for symbol name.
> > > > > So do that and modify kdbnearsym() callers to pass a symbol name buffer
> > > > > allocated statically and hence remove custom debug heap allocator.
> > > >
> > > > Why make the callers do this?
> > > >
> > > > The LRU buffers were managed inside kdbnearsym() why does switching to
> > > > an approach with a single buffer require us to push that buffer out to
> > > > the callers?
> > > >
> > >
> > > Earlier the LRU buffers managed namebuf uniqueness per caller (upto
> > > 100 callers)
> >
> > The uniqueness is per symbol, not per caller.
> >
> 
> Agree.
> 
> > > but if we switch to single entry in kdbnearsym() then all
> > > callers need to share common buffer which will lead to incorrect
> > > results from following simple sequence:
> > >
> > > kdbnearsym(word, &symtab1);
> > > kdbnearsym(word, &symtab2);
> > > kdb_symbol_print(word, &symtab1, 0);
> > > kdb_symbol_print(word, &symtab2, 0);
> > >
> > > But if we change to a unique static namebuf per caller then the
> > > following sequence will work:
> > >
> > > kdbnearsym(word, &symtab1, namebuf1);
> > > kdbnearsym(word, &symtab2, namebuf2);
> > > kdb_symbol_print(word, &symtab1, 0);
> > > kdb_symbol_print(word, &symtab2, 0);
> >
> > This is true but do any of the callers of kdbnearsym ever do this?
> 
> No, but any of prospective callers may need this.
> 
> > The
> > main reaason that heap stuck out as redundant was that I've only ever
> > seen the output of kdbnearsym() consumed almost immediately by a print.
> >
> 
> Yeah but I think the alternative proposed in this patch isn't as
> burdensome as the heap and tries to somewhat match existing
> functionality.
> 
> > I wrote an early version of a patch like this that just shrunk the LRU
> > cache down to 2 and avoided any heap usage... but I threw it away
> > when I realized we never carry cached values outside the function
> > that obtained them.
> >
> 
> Okay, so if you still think that having a single static buffer inside
> kdbnearsym() is an appropriate approach for time being then I will
> switch to use that instead.

Sorry to drop this thread for so long.

On reflection I still have a few concerns about the current code.
To be clear this is not really about wasting 128 bytes of RAM (your
patch saves 256K after all).

It's more that the current static buffers "look weird". They are static
so any competent OS programmer reads them and thinks "but what about
concurrency/reentrancy"). With the static buffers scattered through the
code they don't have a single place to find the answer.

I originally proposed handling this by the static buffer horror in
kdbnearsym() and describing how it all works in the header comment!
As much as anything this was to centralize the commentary in the
contract for calling kdbnearsym(). Hence nobody should write the
theoretic bug you describe because they read the contract!

You are welcome to counter propose but you must ensure that there are
equivalent comments so our "competent OS programmer" from the paragraph
above can figure out how the static buffer works without having to run 
git blame` and digging out the patch history.


Daniel.



> 
> -Sumit
> 
> >
> > > > > @@ -526,6 +526,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
> > >
> > > >
> > > > > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > > > > index 9d69169582c6..6efe9ec53906 100644
> > > > > --- a/kernel/debug/kdb/kdb_main.c
> > > > > +++ b/kernel/debug/kdb/kdb_main.c
> > > > > @@ -526,6 +526,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
> > > >
> > > > The documentation comment for this function has not been updated to
> > > > describe the new contract on callers of this function (e.g. if they
> > > > consume the symbol name they must do so before calling kdbgetaddrarg()
> > > > (and maybe kdbnearsym() again).
> > > >
> > >
> > > I am not sure if I follow you here. If we have a unique static buffer
> > > per caller then why do we need this new contract?
> >
> > I traced the code wrong. I thought it shared symtab->sym_name with its
> > own caller... but it doesn't it shares synname with its caller and
> > that's totally different...
> >
> >
> > Daniel.
> >
> > >
> > > >
> > > > >       char symbol = '\0';
> > > > >       char *cp;
> > > > >       kdb_symtab_t symtab;
> > > > > +     static char namebuf[KSYM_NAME_LEN];
> > > > >
> > > > >       /*
> > > > >        * If the enable flags prohibit both arbitrary memory access
> > > > > diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> > > > > index b59aad1f0b55..9b907a84f2db 100644
> > > > > --- a/kernel/debug/kdb/kdb_support.c
> > > > > +++ b/kernel/debug/kdb/kdb_support.c
> > > > > @@ -57,8 +57,6 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
> > > > >  }
> > > > >  EXPORT_SYMBOL(kdbgetsymval);
> > > > >
> > > > > -static char *kdb_name_table[100];    /* arbitrary size */
> > > > > -
> > > > >  /*
> > > > >   * kdbnearsym -      Return the name of the symbol with the nearest address
> > > > >   *   less than 'addr'.
> > > >
> > > > Again the documentation comment has not been updated and, in this case,
> > > > is now misleading.
> > >
> > > Okay, I will fix it.
> > >
> > > >
> > > > If we move the static buffer here then the remarks section on this
> > > > function is a really good place to describe what the callers must do to
> > > > manage the static buffer safely as well as a convenient place to mention
> > > > that we tolerate the reuse of the static buffer if kdb is re-entered
> > > > becase a) kdb is broken if that happens and b) we are crash resilient
> > > > if if does.
> > > >
> > > >
> > > > > @@ -79,13 +77,11 @@ static char *kdb_name_table[100]; /* arbitrary size */
> > > > >   *   hold active strings, no kdb caller of kdbnearsym makes more
> > > > >   *   than ~20 later calls before using a saved value.
> > > > >   */
> > > > > -int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> > > > > +int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab, char *namebuf)
> > > >
> > > > As above, I don't understand why we need to add namebuf here. I think
> > > > the prototype can remain the same.
> > > >
> > > > Think of it simple that we have reduce the cache from having 100 entries
> > > > to having just 1 ;-) .
> > >
> > > Please see my response above.
> > >
> > > -Sumit
> > >
> > > >
> > > >
> > > > Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
