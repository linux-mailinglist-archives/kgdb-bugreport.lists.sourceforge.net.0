Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0D8ADABE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 02:20:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz3tc-0001ml-IO
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 Apr 2024 00:20:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rz3tb-0001mf-9V
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 00:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vYcNw3oZL/qpooX0WCyBWjpCBFiURVUxekbnrDIkk5Q=; b=ZR6b1j4qAC2hARteYAvzDq6vae
 tMQrJIBDnXjXJkVQGPynYeQxcKLb9T3QvHAJms0o9cMbK6Qm6itMLp2R5fDqhsiK6IbymB5w6TO9J
 QI0+06+Ze/gPlvwL9SdWXm33KPSZSHPxKycwIn3euDkFiNXVvghiPQH0cSLk4WzsxPmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vYcNw3oZL/qpooX0WCyBWjpCBFiURVUxekbnrDIkk5Q=; b=Q/xu2M4ADCYwQhf4faVfJNJtH1
 PQAP891SLMelFRYoxv8SarsC+zfg8s1xYvOJnBy1lMCdIgWXFR+CNziOoFapDrEAxETriYbKT8Bq/
 1/qARRdkhNuROzKf149U78Xd9CucQ9Z7eYGOptUGso5LDwKZXlcgeDfK/hyugNbHdZcQ=;
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz3ta-0004ta-7k for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 00:20:27 +0000
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-7ed6cf3e7f8so567674241.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 17:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713831615; x=1714436415;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYcNw3oZL/qpooX0WCyBWjpCBFiURVUxekbnrDIkk5Q=;
 b=KFSnr/C/yB4o9gmrjlTxuRCH8Qn8ejycYU3M52YOdFupwA7uSYOXzD+3ToWJmoFhnL
 Ta/VF2JxFJV9Al0eeWBEje5E6JKOLIRDDr9xlOcr8OGgceIYNFZ6z6oBeiyfiSph+dX7
 LrmSlQqGUHm1uM+ofNd+AOfxmTOJz1M0/8gIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713831615; x=1714436415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYcNw3oZL/qpooX0WCyBWjpCBFiURVUxekbnrDIkk5Q=;
 b=cluTvJYZP33KNMR6mhXdAgGd6Q1WWtROIPkV39QMikTP1SoEt/tAgGl8i6xk091zsY
 f9Vh6SSi+W8sHwElnLbbW4FjPAeyAYtsg7+TR6sBtGTYMAhmRVCHzmFxuvsRtwFPQKJ/
 AbsH5I70D7gj6IIhwIvR9k/iJ1pqXlhUKvtXb9fJ8eJcvD9TPjQWypWM+HV4GlzGpKZe
 BU2tvVWrkAZAwbeqGHc9gWw04oB5JRM7LVmRQPH81FBGsaD50wcHIFr8iL2gO1VSOF2X
 Hu/U0tqQuEOq4RJlkdknWehDVpQNUO1qmP8gpKg387IAMu358TcBEbMWOS7Sm7ftsVWz
 Owpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgzaoXHeeenjTFEPUeau90uXMYMcNvsf4GqSMbtRVj6n6rEsgFqhrrne40YzqpD59OD8Jn/QNYRh1T1VAbEACL+E7J2dHiOQsOKL3AeCgVQNkmWl8=
X-Gm-Message-State: AOJu0YxZD0IaDNms6ft1lF0o9PoG4u4SIwJRh3xOxf7No+7RMTlQ2tsQ
 Wr/VY3TMMuCeA8t4J4xgk+Gr7wZNLn8DxbqgrU9uu6iGFLljtISoW7QKjszhRuBBcTFwuZJD77M
 xnU/T
X-Google-Smtp-Source: AGHT+IGBojo/7e9OFKZ3ZF1fi1VUHldViz33KhYATF28lWC83doesyDSQ+DuZQsG4XSEkk9n6tR/3A==
X-Received: by 2002:aca:110b:0:b0:3c7:dfb:a295 with SMTP id
 11-20020aca110b000000b003c70dfba295mr11778120oir.55.1713829971999; 
 Mon, 22 Apr 2024 16:52:51 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05620a112300b0078ed3667cb8sm4738577qkk.124.2024.04.22.16.52.51
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 16:52:51 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-434ffc2b520so79211cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:52:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPf2PfHqLVcfbiVexJZc1+VkcU3ZzwB0/nJXZqyjAoZ+37trT31lgQB8B7EjozgeSzDBZHfu1TGhoxc4RqhwZdA59EhtFDn+L4rAIKz028qgkYrEY=
X-Received: by 2002:ac8:65c5:0:b0:437:ca6d:12bd with SMTP id
 t5-20020ac865c5000000b00437ca6d12bdmr64078qto.13.1713829970853; Mon, 22 Apr
 2024 16:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-6-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-6-ed51f7d145fe@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 16:52:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WpHKRGdtnRpq+Bxj0CYX3wUvYV0OmRe0V=zMwVn1AHTQ@mail.gmail.com>
Message-ID: <CAD=FV=WpHKRGdtnRpq+Bxj0CYX3wUvYV0OmRe0V=zMwVn1AHTQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 22, 2024 at 9:38 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > At several points in kdb_read() there are variants of the following
    > code pattern (with offsets slightly alte [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.47 listed in wl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.222.47 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz3ta-0004ta-7k
Subject: Re: [Kgdb-bugreport] [PATCH v2 6/7] kdb: Replace double memcpy()
 with memmove() in kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEFwciAyMiwgMjAyNCBhdCA5OjM44oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBBdCBzZXZlcmFsIHBvaW50cyBp
biBrZGJfcmVhZCgpIHRoZXJlIGFyZSB2YXJpYW50cyBvZiB0aGUgZm9sbG93aW5nCj4gY29kZSBw
YXR0ZXJuICh3aXRoIG9mZnNldHMgc2xpZ2h0bHkgYWx0ZXJlZCk6Cj4KPiAgICAgbWVtY3B5KHRt
cGJ1ZmZlciwgY3AsIGxhc3RjaGFyIC0gY3ApOwo+ICAgICBtZW1jcHkoY3AtMSwgdG1wYnVmZmVy
LCBsYXN0Y2hhciAtIGNwKTsKPiAgICAgKigtLWxhc3RjaGFyKSA9ICdcMCc7Cj4KPiBUaGVyZSBp
cyBubyBuZWVkIHRvIHVzZSB0bXBidWZmZXIgaGVyZSwgc2luY2Ugd2UgY2FuIHVzZSBtZW1tb3Zl
KCkgaW5zdGVhZAo+IHNvIHJlZmFjdG9yIGluIHRoZSBvYnZpb3VzIHdheS4gQWRkaXRpb25hbGx5
IHRoZSBzdHJpbmdzIHRoYXQgYXJlIGJlaW5nCj4gY29waWVkIGFyZSBhbHJlYWR5IHByb3Blcmx5
IHRlcm1pbmF0ZWQgc28gbGV0J3MgYWxzbyBjaGFuZ2UgdGhlIGNvZGUgc28KPiB0aGF0IHRoZSBs
aWJyYXJ5IGNhbGxzIGFsc28gbW92ZSB0aGUgdGVybWluYXRvci4KPgo+IENoYW5naW5nIGhvdyB0
aGUgdGVybWluYXRvcnMgYXJlIG1hbmFnZWQgaGFzIG5vIGZ1bmN0aW9uYWwgZWZmZWN0IGZvciBu
b3cKPiBidXQgbWlnaHQgYWxsb3cgdXMgdG8gcmV0aXJlIGxhc3RjaGFyIGF0IGEgbGF0ZXIgcG9p
bnQuIGxhc3RjaGFyLCBhbHRob3VnaAo+IHN0b3JlZCBhcyBhIHBvaW50ZXIsIGlzIGZ1bmN0aW9u
YWxseSBlcXVpdmFsZW50IHRvIGNhY2hpbmcgc3RybGVuKGJ1ZmZlcikuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+
ICBrZXJuZWwvZGVidWcva2RiL2tkYl9pby5jIHwgMTkgKysrKysrKy0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKClJldmlld2Vk
LWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFp
bGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
