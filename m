Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B3310ACB
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Feb 2021 13:01:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7znJ-0001ej-UA
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Feb 2021 12:01:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l7znI-0001dc-KX
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Feb 2021 12:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2MAewSOJTY0XEc1fHR/Z2us/+0lMn/FOWKspEUJhCn0=; b=Mcgr12WFKtYSQKLCnQHH6xRqm5
 mlf7SttUIKibhkixgAACD0FgZ58Ma/UjOpdzs/CeIyc2LsDvrbUvp3bZJylA2qQ+Jo7EYXX7YGFX5
 k3YeyWUQJa3qFh2SJou2DFzI5OpEgEkVNEZosHgM8vSm3/hshvnoLp+KLzkxeIITuYag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2MAewSOJTY0XEc1fHR/Z2us/+0lMn/FOWKspEUJhCn0=; b=NGn4zjGG+SwFY3dqWRU2vNn7ux
 qo695CL9UD1E10FJknd2pxMubsXGVhFUCLtSugSTxEKNrv4rv2XIzuML0J7NDtKFcV9kUc4TnADkU
 k5mKqAk8UHWBxWQXlygzShyzBttGRFsH/abbdqwvkSZfc6Uh2Imc5fSgoZaldht8Kn1Q=;
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l7zmv-0000mR-Gs
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Feb 2021 12:01:00 +0000
Received: by mail-yb1-f175.google.com with SMTP id e132so6462746ybh.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Feb 2021 04:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2MAewSOJTY0XEc1fHR/Z2us/+0lMn/FOWKspEUJhCn0=;
 b=t35la4YxgtDyVYSK6mLaqLmMGzudoQEgtaCLGdvvQ8qS9PP/QzKvLPVoZjmuChE0Xh
 4B2J0ta7p5R56ENqLLNtHOx3fxRl6t+wBu24VOQE/72k3zqiP4tegJ8Deqan2Bdf/hp6
 B9Ukjh00Ang10KbY+vw/0Um+7W0qBf1CQ0J6E0NHa4Gz0IUBP5V5x4DmKvtzkxXpXVNa
 cZnkBCq1YjPdZ2Ydc+6Ktlq78/PatCw2omeVswS5rFsYZSUmwGIxaiHqrGirblo6Ugg2
 h8Vt3vhjeSq5yoFhT4h2AmlWau4l0QHJTGUPfJt+uc3GbD+KREdlYwT7zLlwdj46RleA
 zTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2MAewSOJTY0XEc1fHR/Z2us/+0lMn/FOWKspEUJhCn0=;
 b=kspMPuSGgh6OPa97mfIFoN6Mrwt1P7VSR/KMNC1ewJIUwWUMwXV0C02bhKF2otWl/L
 sHRmmFllQXhbqyDrD4Jr2erkOkGH8eRQ5B8AW9cEh/b8A4tFl2aVBkR9CaQXP4f+8zmw
 nutrwtDyI6xxE5yVRqmsf9IyjfnjamM//tCfWAtXkwAucxx6lbCymICrHyyN0qfUr8vE
 2TOSSvoUH2GnJOEwZHCP5QpgCHq6OuTRKo5rrpEIndwjQKp1hiLybiofwSLVa1FN+64b
 MT2YJfV0p99BvAu0AgrcmHVwQU9afq6aMsuZzrW+prDMItl7abuZRhUCBnK6jvb1a1e7
 /h/g==
X-Gm-Message-State: AOAM53399tBgW1Uel8JLLbBiaGl0MlcogV9iBE8b07Y/5rms6DSeOU/S
 oQ+JpK3pSfcCj7qu9apms6ncJS9WuKQMQSjj7No=
X-Google-Smtp-Source: ABdhPJyGBBPoo/yoV2GNZP34DnLXQ2Uc/uiTsv0GpFv4V5jtJIGudWGFNN2nikpUOwWGL5a+Ac7T0KBwEL5o/kGhtnU=
X-Received: by 2002:a25:1387:: with SMTP id 129mr5303669ybt.423.1612526431840; 
 Fri, 05 Feb 2021 04:00:31 -0800 (PST)
MIME-Version: 1.0
References: <1612440429-6391-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210204155635.ibvnyzo7qqgysfhl@maple.lan>
In-Reply-To: <20210204155635.ibvnyzo7qqgysfhl@maple.lan>
From: Stephen Zhang <stephenzhangzsd@gmail.com>
Date: Fri, 5 Feb 2021 20:00:20 +0800
Message-ID: <CALuz2=e8Mb70Fgyj_PG-x1Lkw8Te9uzPg=xLJUOmMMUn7sxCtg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.175 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1l7zmv-0000mR-Gs
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH v4] kdb: kdb_support: Fix debugging
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4g5LqOMjAyMeW5tDLm
nIg05pel5ZGo5ZubIOS4i+WNiDExOjU25YaZ6YGT77yaCgo+Cj4gSXQgaXMgYXJndWFibGUgdGhh
dCB0aGVyZSBzaG91bGQgYmUgYSBSZXZpZXdlZC1ieTogZnJvbSBEb3VnIGhlcmUuLi4KPiBhbHRo
b3VnaCBnaXZlbiB0aGUgYmlnIGNoYW5nZXMgaW4gdjMgSSBkb24ndCB0aGluayB5b3Ugd2VyZSB3
cm9uZwo+IHRvIGRyb3AgaXQuCj4KPiBOZXZlcnRoZWxlc3MuLi4gZ2l2ZW4gdGhlIGltcGxpY2l0
IFItYiAoIndoZW4gRGFuaWVsIG1lcmdlcyIpIGluIERvdWcncwo+IGNvbW1lbnRzIG9uIHYzIEkg
ZGVjaWRlZCB0byByZWluc3RhdGUgaXQuCj4KPiBObyBhY3Rpb24gbmVlZGVkIGZyb20geW91IG9u
IHRoaXMuIEkgaGF2ZSBmaXhlZCB1cCBhbGwgdGhlc2UgaXNzdWVzCj4gd2hlbiBJIGFwcGxpZWQg
dGhlIHBhdGNoLiBUaGFua3MhCj4KPgo+IERhbmllbC4KPgoKVGhhbmsgeW91IGZvciBwb2ludGlu
ZyBvdXQgdGhlc2UgaXNzdWVzLgoKClN0ZXBoZW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1i
dWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
