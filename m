Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970C30BCBD
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Feb 2021 12:16:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l6tf6-00061L-2Y
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Feb 2021 11:16:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l6tf4-000617-VY
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Feb 2021 11:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1fOhkDGQL5r6btt5jF2aLR1byrQUIG2RyJbuamotSRo=; b=JaoC+QAZvgFzXuKYvpEMGr2Ibm
 n0pCj1Z/Jy8i5HXDeN8ck9FPd16Lr1BGTYMtBnJjVzqnqL6Z7c9BhV0lsN9lO6o0nxMYVYlxU/GnU
 tnaUNHv1P+ZpwO2SLFBwJV3Refve6//SGcqnF1DoNM4spFTCKDEMDBZfcvEXtiMMB/FA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1fOhkDGQL5r6btt5jF2aLR1byrQUIG2RyJbuamotSRo=; b=IR0JplcjvXAf4R26yYJGp5a/fg
 QIjShXPKX4JHA6GCXseLFLmkwrBuVnr3XRbfLx+K5H8I9r7b0dqtDt2J8sL5kN8nmyCnJK2VQN+l0
 ClCZaW5HpSvineYLZAZojadADchyRJz/uoxEMXX/NeCGpk27fjV1cElRsgbCOkmnE28Y=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l6tep-00ER9T-Qq
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Feb 2021 11:15:58 +0000
Received: by mail-yb1-f172.google.com with SMTP id k4so20045296ybp.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Feb 2021 03:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fOhkDGQL5r6btt5jF2aLR1byrQUIG2RyJbuamotSRo=;
 b=q7GfDGTxBT5MPbX+EfvnO32C+FYuMl/IrN2M6AmM7sFjPbMoStVLCG32Igjji5ireR
 2xWAHyInq3oDOCBAzXB0ozuGjC43Kyy0KmlVI1ZloL0lo2mKpXD22nMWCY/HQJW1JyID
 f6SEaPnGVHEc7VeFh54EKi0mYXx6HgiIiJhzIGb8I+FNBzT5H7kr4KW+GqtwAg42oKt4
 p3XnDUlXAFaP2xA4zV2PtUytEwDEqnvRnbce8BAp6GTQhalwX29KMgKdXrShIo+IEje9
 hXDPNHfohg9hxaV0AemHDIcelp0r5Wh4xLsx2Uy9n+XuzB7BJ8Ux+AGOwR+mdA0BktIq
 E1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fOhkDGQL5r6btt5jF2aLR1byrQUIG2RyJbuamotSRo=;
 b=a7Lh50CGaS0qzv68ryTnrRw5Wn2h85tyzb8oOgPRMegR7Fgxu9Ilzd9DlLS+Wot85c
 Ctxvv/3JTGF8qnNPiD1YdVzq4wFBqgqaUxKHjLOorI9K7mptJb8aKAeIBVG87yJoq4cX
 55YdM8qdFhuUmSgGVFkhVe2zypeiEZxADcMRLb7cG6iMbR/+n4PlCbYHpV/HI5pQWgwF
 KNINUveC8Z0I9QgYwJoEZkwmnqO0hAYXy38yZurPS9wFoBebnaDCLNAKf3pI0U7NUspR
 HRI7Y2g+euSs1k2eW6rx2pC743S+5nK7s9bQk7PUS5925LDn5rAc7FKhqwmYfI2tjiN2
 QVuQ==
X-Gm-Message-State: AOAM533Bxc7i0OPoUAt7lF6QzELj/g+jhfnaeJ41a5zNZH7BbWZR7CVh
 ic9R0M2LW6glZ4t3CiG2qfUnfNZSvGNTDrbJuds=
X-Google-Smtp-Source: ABdhPJxqThE3uvbAzEKnmHwiU24ZZRidNLyfOH78c5BTW1TFosLcbOOVAhhqS4l35WpdPd+hZaX+H7UsoqrZJuYKtr4=
X-Received: by 2002:a25:8245:: with SMTP id d5mr10481597ybn.182.1612264538141; 
 Tue, 02 Feb 2021 03:15:38 -0800 (PST)
MIME-Version: 1.0
References: <1612005840-4342-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=WQ7iCQFf6Qb3agM4DCt_Df3c6BwV_T6tEMMxXArbY_5A@mail.gmail.com>
In-Reply-To: <CAD=FV=WQ7iCQFf6Qb3agM4DCt_Df3c6BwV_T6tEMMxXArbY_5A@mail.gmail.com>
From: Stephen Zhang <stephenzhangzsd@gmail.com>
Date: Tue, 2 Feb 2021 19:15:26 +0800
Message-ID: <CALuz2=erXGa2q_ODOpARK9yb_GQo0nOLWnP-PuBMCc+pv8Cp4Q@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
X-Headers-End: 1l6tep-00ER9T-Qq
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: kdb_support: Fix debugging
 information problem
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

>
>
> > @@ -147,11 +141,10 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t
> *symtab)
> >
> >         if (symtab->mod_name == NULL)
> >                 symtab->mod_name = "kernel";
> > -       if (KDB_DEBUG(AR))
> > -               kdb_printf("kdbnearsym: returns %d
> symtab->sym_start=0x%lx, "
> > -                  "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n",
> ret,
> > -                  symtab->sym_start, symtab->mod_name, symtab->sym_name,
> > -                  symtab->sym_name);
> > +       kdb_dbg_printf(AR, "returns %d symtab->sym_start=0x%lx, "
> > +               "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
> > +               symtab->sym_start, symtab->mod_name, symtab->sym_name,
> > +               symtab->sym_name);
>
> This indention doesn't line up, but it didn't before.  I guess I'd let
> Daniel say if he likes this or would prefer different wrapping /
> indentation.
>

Thanks for your patience. You told me that  the alignment for continued
arguments is to
match up with the first argument, so I was confused that the first line and
the second line
here don't follow the rule.  There are many  cases like this in  this file.

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
