Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C3312DF6
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Feb 2021 10:54:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l93Ft-0000Rp-TS
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Feb 2021 09:54:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l93Fs-0000Rc-1H
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 09:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bvINO3Dqf9GYw5Bbhf3syQ8zjJwNC62ESu6hTyzUQHk=; b=FpOhUVxVynQ5RfKu7p1xE3Y0sN
 iX36cNqYbsc5sKgNOE6586czEWo+FsqsHBOlagULyBnQkEPl6kVIxBDfsacsfd95OhtqfUGWTb2wR
 MMYvRUmEsJ5/Q9f80TuOL1/CgZwQb4fsS/lPVdIENBQrJapcG7PkauAG2hUma/MLJBjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bvINO3Dqf9GYw5Bbhf3syQ8zjJwNC62ESu6hTyzUQHk=; b=bIXTXWAf+0TwCB7VPUlY2H01GY
 ynrT3KaMejF7rN10HQAj8hy16X/xUoBRnTHl2sSQwSG0KP/0uD1MOHgVqxwmemK/HSROoY9eUGP5l
 hSGVW0yY0Xe9s7q+xQ0H1QK+lf3VsUIfHKsQa/3c8efBpm3drM18xn5vFwzbrBJfaUuM=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l93Ff-00FBuf-8B
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 09:54:51 +0000
Received: by mail-ej1-f42.google.com with SMTP id jj19so23608140ejc.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Feb 2021 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bvINO3Dqf9GYw5Bbhf3syQ8zjJwNC62ESu6hTyzUQHk=;
 b=jWB6vPNGP1rv5/2u3F4WgblpbSq4CbDXLGDm0GDa4cQl3UzBC6FOJQ1JzwnthSspjc
 F2t5lohHh5nAaFYSX3P6JSg8D2X4hfDjvRVWoh3DMWg4sSA0/i3G468NP8xqeC1il0EY
 aNOf1UpLMO1OshNFP5CyCyoxkWdbNd8AGjstg+W6bNiO6ZjyND8jKx+T44p+hWuklbMX
 vfxIPTHgLi+OS+9Jlze+fERZlSx/eMUTaNTr7apsMWnZa9xhi6llW1cDw3wKhIXdAFhA
 JUudHBZzTlwC1cFJof12m6P9Dd3J2I/lh28hp41TUyaAxpc5pvduWgeqFKKCbEvZaXxr
 PTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvINO3Dqf9GYw5Bbhf3syQ8zjJwNC62ESu6hTyzUQHk=;
 b=IwNSeTymAtLo51RPYsk9vepVRsYlPXyjwQ1GLaiY5mavViKYyEkLXy8d9LcbufBCcA
 9cdb5oaInxLgSyyFo9LwWIT4vMbI+fZL+leIlb3xvGvKM0N9GQxX2g6jtJVKprH3MUlQ
 EJ8HAGsCulpiGvkgTxJksZ4pYm73N5pBm9oGN6XEKyv2hhja7GIAm0o4qVl1zDIX1IkS
 eU4aT4BGPR9mvIzeQy+tORdajQluB0If70eRsYSztoLrxoIExycujQZLojzMHlTdIXM3
 0NohGmrjyJ1fwrT01wV+yQqQcbmbJYUdYgS/dccUcfko1/oL9rvmJ4/D6O3C9Erqyzt7
 7EWA==
X-Gm-Message-State: AOAM532iYNW7ZkhIDEs6IkwzRXqaDmEpl6MWRSVb/4OtHrtdO8auPQd0
 /U37LM5BCAmvNtHZrl2tMmP24gOlKHoN1Z9WlGdxI4LUUaI=
X-Google-Smtp-Source: ABdhPJx3yEHwPtUa4CJiRrMcQkDBsqs+InrhswAse6y2TIsInAwCPF+xZ/4dHIEewdl/VfA7LgKaTunmltKF2gY/1aE=
X-Received: by 2002:a2e:818e:: with SMTP id e14mr2682466ljg.226.1612777710918; 
 Mon, 08 Feb 2021 01:48:30 -0800 (PST)
MIME-Version: 1.0
References: <1611915427-3196-1-git-send-email-sumit.garg@linaro.org>
 <20210208094303.csu2kkyi25d7a25y@maple.lan>
In-Reply-To: <20210208094303.csu2kkyi25d7a25y@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 8 Feb 2021 15:18:19 +0530
Message-ID: <CAFA6WYNDydeDg8J16tFC30=yXCDMeaMKOm0Jt-3yF5jUMCq0yQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l93Ff-00FBuf-8B
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Simplify kdb commands
 registration
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

On Mon, 8 Feb 2021 at 15:13, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Fri, Jan 29, 2021 at 03:47:07PM +0530, Sumit Garg wrote:
> > @@ -1011,25 +1005,17 @@ int kdb_parse(const char *cmdstr)
> >               ++argv[0];
> >       }
> >
> > -     for_each_kdbcmd(tp, i) {
> > -             if (tp->cmd_name) {
> > -                     /*
> > -                      * If this command is allowed to be abbreviated,
> > -                      * check to see if this is it.
> > -                      */
> > -
> > -                     if (tp->cmd_minlen
> > -                      && (strlen(argv[0]) <= tp->cmd_minlen)) {
> > -                             if (strncmp(argv[0],
> > -                                         tp->cmd_name,
> > -                                         tp->cmd_minlen) == 0) {
> > -                                     break;
> > -                             }
> > -                     }
> > -
> > -                     if (strcmp(argv[0], tp->cmd_name) == 0)
> > +     list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> > +             /*
> > +              * If this command is allowed to be abbreviated,
> > +              * check to see if this is it.
> > +              */
> > +             if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen) &&
> > +                 (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0))
> >                               break;
>
> Looks like you forgot to unindent this line.
>
> I will fix it up but... checkpatch would have found this.
>

Ah, I missed to run checkpatch on v3. Thanks for fixing this up.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
