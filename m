Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72E312B51
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Feb 2021 08:57:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l91Qb-0003U0-Rh
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Feb 2021 07:57:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l91Qa-0003Tt-OG
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 07:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VG1LiiS+OLuU2/TNT8nMqerA0shnJ5i/ySWOppULYpo=; b=GwFDbmDLve2fSfOv31DQ+lH/4h
 vWVM2Xui9NTVYEOjoiVjsBs5gVoOatpZxV/25KiOBPmzhbfy02/aA6xFgcZAvpIsYr/BhvNDbTFEq
 oQ1bIZvUO7pocRjlTvOP1RWavpuVa6t/S41pwX0ZJkdlBApKDLmpjozMu7ij/p4GUpNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VG1LiiS+OLuU2/TNT8nMqerA0shnJ5i/ySWOppULYpo=; b=IRroe0WtQebMRw9w+Rqhz0jTTA
 a3+G31Os5ulhdFm7dFTIdd7vy71kHuTt59BK1AIyLsC+pFFFfM/522wOhGW+0fUmrTmLMFbmfDe9P
 hP0+7VnExJ8HpAFkuJQNh+zdfikpRbnpnTX4/9MR8ihs8UqwxtbLEX5jfY5Xhicj6LQo=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l91QL-0007RQ-Kn
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 07:57:48 +0000
Received: by mail-lf1-f54.google.com with SMTP id p21so20812662lfu.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 07 Feb 2021 23:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VG1LiiS+OLuU2/TNT8nMqerA0shnJ5i/ySWOppULYpo=;
 b=r6D7M+IC6qGh6DxP/vMpbQm8u0LA0YnWhpU52gTuQhxbutJtO3Zy/MQ06WYSCjs7ZO
 LJTqajsq/s8LvekwJjIaGcvIbw/2sIHAHGch5hAHR7iQNDMaPZNDUNd/24O6Bw0ru2za
 e7xtvT5nETjhNOYZa0+cS5e8TGfjY5o1CYmfftOGbFAeaUm9LH8Jn3jm2xxkUkCcOj5H
 MaEgG2TJtbB/3tOGAh4WYsamZ7Qb/Za1ezzx/4/GcN9nqKdbVLLdCoe4t3GghhfZaO/G
 cQyvgxgjaQlWbL5NKclCkdO+A8zN+phAi2qI8gvvpz5/52MaelQjRuIi+YIV8s2sRD+2
 dPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VG1LiiS+OLuU2/TNT8nMqerA0shnJ5i/ySWOppULYpo=;
 b=WVZwHS0jhe/qVBQ80B1e3amyF9BgetXOBw/KK6zwvgLaCUqu1pl8iJaSn2U8WW9Wja
 TVX7/8rLZCpn5rYNlilqwoQh2hMS6sE8T4JhnkVQTQiFI8WoDfHGFsbCUK4h9HrsJYc1
 srlWNpClSpHzG/bk3dqnptNNGu3pS5tFO3ixOYY+nsh6K1s+U1qFMopcqAmGWUzg8D4q
 uTaCmVPaWOTcEKcf5a+WOxsZi9Rqnz018ltXETk/FF3X/ah/fYEJ+A4EVQ7QqkF4+Dwj
 QhrVOBxROElSMETQKYpdDcV5X6R9NueKBn3eOxiYogx/Qx8P+TH5VfOdBJzGF6rtUXbY
 Ra6Q==
X-Gm-Message-State: AOAM533kBH8nHaHQLSKESZxg/yfPxJOCtzgra+4BDpGzWFx6Xm6SipUU
 QVaQcvkyhV1ZArc7AyzaRZNzcjCnj1K+UtE0xDpT/Q==
X-Google-Smtp-Source: ABdhPJyEpCy4OkP6RsMGFIjGo6cp55hrzqlVSynNb6AEwqxJnc+3Azji5v9wf9Zzn0Hk5vQYX2HSF1PkwIGhddTdXYY=
X-Received: by 2002:ac2:46d6:: with SMTP id p22mr3145726lfo.84.1612771047070; 
 Sun, 07 Feb 2021 23:57:27 -0800 (PST)
MIME-Version: 1.0
References: <1612433660-32661-1-git-send-email-sumit.garg@linaro.org>
 <20210205173627.guzsj4lfczimvp6d@maple.lan>
In-Reply-To: <20210205173627.guzsj4lfczimvp6d@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 8 Feb 2021 13:27:16 +0530
Message-ID: <CAFA6WYMAe2G_z0Qy3qXNsDbEvpFOCGCzO_7eUxVc5YEg=tMkpg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l91QL-0007RQ-Kn
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Refactor env variables get/set
 code
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

Hi Daniel,

On Fri, 5 Feb 2021 at 23:06, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Thu, Feb 04, 2021 at 03:44:20PM +0530, Sumit Garg wrote:
> > @@ -318,6 +318,65 @@ int kdbgetintenv(const char *match, int *value)
> >  }
> >
> >  /*
> > + * kdb_setenv() - Alter an existing environment variable or create a new one.
> > + * @var: Name of the variable
> > + * @val: Value of the variable
> > + *
> > + * Return: Zero on success, a kdb diagnostic on failure.
> > + */
> > +static int kdb_setenv(const char *var, const char *val)
> > +{
> > +     int i;
> > +     char *ep;
> > +     size_t varlen, vallen;
> > +
> > +     varlen = strlen(var);
> > +     vallen = strlen(val);
> > +     ep = kdballocenv(varlen + vallen + 2);
> > +     if (ep == (char *)0)
> > +             return KDB_ENVBUFFULL;
> > +
> > +     sprintf(ep, "%s=%s", var, val);
> > +
> > +     ep[varlen+vallen+1] = '\0';
>
> What is this line for? It looks pointless to me.
>

Yeah, it looks redundant to me as well.

> I know it's copied from the original code but it doesn't look like the
> sort of code you should want your name to appear next to in a git blame
> ;-) .
>

Sure, let me get rid of it in v3.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
