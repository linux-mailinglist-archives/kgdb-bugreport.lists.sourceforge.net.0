Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1E8ADAD0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 02:21:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz3ut-00043k-Ac
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 Apr 2024 00:21:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rz3uo-00043Z-E6
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 00:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OvKHZ9JjRUWbi49dOaz2jnKn8wC1TnFH6x1+VhyrjCQ=; b=Ah0mrHgiNp9LMEb+hYZpfzimLe
 KR4vdxHTaNFe7MOSLQBJ+aXAsxeH5y6cyprVXvUtfxq+hnQYrUAYPDUm2kojCzkilvld3vn15zcct
 KRtkuCcm4cGovxNVnut/AW36Vx0phKsriT2/DCy9/FdESw1z22s0huHup9mN3Qt+c1yU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OvKHZ9JjRUWbi49dOaz2jnKn8wC1TnFH6x1+VhyrjCQ=; b=fT9kIjJtLbfcjtuNmd//B74Bs7
 eMl+4J+0rgFczveajvDuHn44ZTK5yBu1gMJ7QE/V2UHl7LQV6lypfLxp7ruAnpUNnLkOvQdks/52u
 Us828jmBY8vWT1qY/7w8k5ITg6Qmt+n26uDOnzpBGvdl5KrB9Kgu5fUP4uUNTVwEEbyM=;
Received: from mail-yb1-f178.google.com ([209.85.219.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz3un-0004zM-98 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 00:21:42 +0000
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-de466c641aaso4400149276.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 17:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713831695; x=1714436495;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvKHZ9JjRUWbi49dOaz2jnKn8wC1TnFH6x1+VhyrjCQ=;
 b=KRYVB72AEc77NZCEkCPxjJm8jY8Q3nd0nlq3nBXgQRqe8hZT3NUoyrIBB6ndO+zUP5
 lKEG4g+V58SuCWox0ONkwmQO6FXjG2Xfgp1orkCZcZfeIoncuz3eg1Na6mCiDUsKhUYO
 L2p9KXmsOk5oaf05HVAzFeFcOVAaL6JLFKiOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713831695; x=1714436495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvKHZ9JjRUWbi49dOaz2jnKn8wC1TnFH6x1+VhyrjCQ=;
 b=hxSy/TdrV4UITwQ9fXeQ4NuA2lWYs9Hb09guy2E/F9yUXTwyIz7p50oiVeRFi1OXrj
 Jhgi14LLanhwC8oHYMS0r9nzhps7FVlP/9iohNqDerfURg3iwiv56HxXPFVDhirE7gxo
 yRJDuXdwfaRes8kDXKeIDVsCSupW8J1c07rVnXhLfqHbKTbieGWStBVUvBXfkO6w3rUR
 dP3u1I8GQdW4PtuQhFK6OLqQC+ycoWlbzq7pC5DAnOmxM1PUXTRPL9MWIILMRvgo2qoN
 doG5tqEP20TyFQWSXAR5uhgSvCt/0+WrTt3cVz3h6LpBUjG4GVc1J1HrFfWVee7mD+mR
 96Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEZ+d2bdU2XDnZSDu99O+JwmpXbGAVXXI3569BRj8Q9mZ7ZHN13dgTEtMRs8R4yABHbrVcFexhb/kHlYK/S1dCdJcdi63wHqe6TrRWFqaoZoKkmcw=
X-Gm-Message-State: AOJu0Yy6MELuQnT+pE31OtdJq7zl06UGoxrXUgOY4/5rsc+Hx3kGNDii
 aXHOu5nHPzFrmijx0dQLbfTIhsNgMrgrYMHL7f9adV3eMzPXoz/XDdrjWdqJgja2ah6Qvpt3dXO
 bOVf7
X-Google-Smtp-Source: AGHT+IFEz0GjDmxhlf8lNt6HFMdctD1KNn6pEAK3Au851o8L4WaPKtsqLQJ8xVtHqLOitiagk1PUlA==
X-Received: by 2002:a54:458b:0:b0:3c7:48a3:b28 with SMTP id
 z11-20020a54458b000000b003c748a30b28mr12944474oib.0.1713829985430; 
 Mon, 22 Apr 2024 16:53:05 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 de19-20020a05620a371300b0078ec3f23519sm4758060qkb.8.2024.04.22.16.53.04
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 16:53:04 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-43989e6ca42so140051cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ4n/i6BKarIuZnOH8xXDxBIkdSGIbzvtRHL9ZXCa0TncrbOMTVYot9tx8g/6g0ORSB6Im2DqdNwidNsPyTjdtVz3OKEqs9CAe6t3yQXFhPXBeUEI=
X-Received: by 2002:ac8:7c6:0:b0:439:b85a:3fa with SMTP id
 m6-20020ac807c6000000b00439b85a03famr67307qth.11.1713829984304; 
 Mon, 22 Apr 2024 16:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-7-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-7-ed51f7d145fe@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 16:52:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XqSmD4WGyBp7Cv1i8X9yjk2gH1y2j_5qzkxtDL+GKv3g@mail.gmail.com>
Message-ID: <CAD=FV=XqSmD4WGyBp7Cv1i8X9yjk2gH1y2j_5qzkxtDL+GKv3g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 22, 2024 at 9:38 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > The current approach to filling tmpbuffer with completion candidates
    is > confusing, with the buffer managemen [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.219.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.178 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz3un-0004zM-98
Subject: Re: [Kgdb-bugreport] [PATCH v2 7/7] kdb: Simplify management of
 tmpbuffer in kdb_read()
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
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgY3VycmVudCBhcHByb2Fj
aCB0byBmaWxsaW5nIHRtcGJ1ZmZlciB3aXRoIGNvbXBsZXRpb24gY2FuZGlkYXRlcyBpcwo+IGNv
bmZ1c2luZywgd2l0aCB0aGUgYnVmZmVyIG1hbmFnZW1lbnQgYmVpbmcgZXNwZWNpYWxseSBoYXJk
IHRvIHJlYXNvbgo+IGFib3V0LiBUaGF0J3MgYmVjYXVzZSBpdCBkb2Vzbid0IGNvcHkgdGhlIGNv
bXBsZXRpb24gY2FuaWRhdGUgaW50bwo+IHRtcGJ1ZmZlciwgaW5zdGVhZCBvZiBjb3BpZXMgYSB3
aG9sZSBidW5jaCBvZiBvdGhlciBub25zZW5zZSBhbmQgdGhlbgo+IHJ1bnMgdGhlIGNvbXBsZXRp
b24gc3RlYXJjaCBmcm9tIHRoZSBtaWRkbGUgb2YgdG1wYnVmZmVyIQo+Cj4gQ2hhbmdlIHRoaXMg
dG8gY29weSBub3RoaW5nIGJ1dCB0aGUgY29tcGxldGlvbiBjYW5kaWRhdGUgaW50byB0bXBidWZm
ZXIuCj4KPiBQcmV0dHkgbXVjaCBldmVyeXRoaW5nIGVsc2UgaW4gdGhpcyBwYXRjaCBpcyByZW5h
bWluZyB0byByZWZsZWN0IHRoZQo+IGFib3ZlIGNoYW5nZToKPgo+ICAgICBzL3BfdG1wL3RtcGJ1
ZmZlci8KPiAgICAgcy9idWZfc2l6ZS9zaXplb2YodG1wYnVmZmVyKS8KPgo+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4g
IGtlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMgfCA0MCArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyMyBk
ZWxldGlvbnMoLSkKCkRlZmluaXRlbHkgYW4gaW1wcm92ZW1lbnQuCgpSZXZpZXdlZC1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCj4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCj4gaW5k
ZXggOTRhNjM4YTlkNTJmYS4uNjQwMjA4Njc1YzlhOCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZGVi
dWcva2RiL2tkYl9pby5jCj4gKysrIGIva2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYwo+IEBAIC0y
MjcsOCArMjI3LDcgQEAgc3RhdGljIGNoYXIgKmtkYl9yZWFkKGNoYXIgKmJ1ZmZlciwgc2l6ZV90
IGJ1ZnNpemUpCj4gICAgICAgICBpbnQgY291bnQ7Cj4gICAgICAgICBpbnQgaTsKPiAgICAgICAg
IGludCBkaWFnLCBkdGFiX2NvdW50Owo+IC0gICAgICAgaW50IGtleSwgYnVmX3NpemUsIHJldDsK
PiAtCj4gKyAgICAgICBpbnQga2V5LCByZXQ7Cj4KPiAgICAgICAgIGRpYWcgPSBrZGJnZXRpbnRl
bnYoIkRUQUJDT1VOVCIsICZkdGFiX2NvdW50KTsKPiAgICAgICAgIGlmIChkaWFnKQo+IEBAIC0z
MTAsMjEgKzMwOSwxNiBAQCBzdGF0aWMgY2hhciAqa2RiX3JlYWQoY2hhciAqYnVmZmVyLCBzaXpl
X3QgYnVmc2l6ZSkKPiAgICAgICAgIGNhc2UgOTogLyogVGFiICovCj4gICAgICAgICAgICAgICAg
IGlmICh0YWIgPCAyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICsrdGFiOwo+IC0gICAgICAg
ICAgICAgICBwX3RtcCA9IGJ1ZmZlcjsKPiAtICAgICAgICAgICAgICAgd2hpbGUgKCpwX3RtcCA9
PSAnICcpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcF90bXArKzsKPiAtICAgICAgICAgICAg
ICAgaWYgKHBfdG1wID4gY3ApCj4gLSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAg
ICAgICAgICAgICAgIG1lbWNweSh0bXBidWZmZXIsIHBfdG1wLCBjcC1wX3RtcCk7Cj4gLSAgICAg
ICAgICAgICAgICoodG1wYnVmZmVyICsgKGNwLXBfdG1wKSkgPSAnXDAnOwo+IC0gICAgICAgICAg
ICAgICBwX3RtcCA9IHN0cnJjaHIodG1wYnVmZmVyLCAnICcpOwo+IC0gICAgICAgICAgICAgICBp
ZiAocF90bXApCj4gLSAgICAgICAgICAgICAgICAgICAgICAgKytwX3RtcDsKPiAtICAgICAgICAg
ICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBfdG1wID0gdG1wYnVmZmVyOwo+
IC0gICAgICAgICAgICAgICBsZW4gPSBzdHJsZW4ocF90bXApOwo+IC0gICAgICAgICAgICAgICBi
dWZfc2l6ZSA9IHNpemVvZih0bXBidWZmZXIpIC0gKHBfdG1wIC0gdG1wYnVmZmVyKTsKPiAtICAg
ICAgICAgICAgICAgY291bnQgPSBrYWxsc3ltc19zeW1ib2xfY29tcGxldGUocF90bXAsIGJ1Zl9z
aXplKTsKPiArCj4gKyAgICAgICAgICAgICAgIHRtcCA9ICpjcDsKPiArICAgICAgICAgICAgICAg
KmNwID0gJ1wwJzsKPiArICAgICAgICAgICAgICAgcF90bXAgPSBzdHJyY2hyKGJ1ZmZlciwgJyAn
KTsKPiArICAgICAgICAgICAgICAgcF90bXAgPSAocF90bXAgPyBwX3RtcCArIDEgOiBidWZmZXIp
Owo+ICsgICAgICAgICAgICAgICBzdHJzY3B5KHRtcGJ1ZmZlciwgcF90bXAsIHNpemVvZih0bXBi
dWZmZXIpKTsKCllvdSdyZSBub3cgdXNpbmcgc3Ryc2NweSgpIGhlcmUuIElzIHRoYXQgYWN0dWFs
bHkgaW1wb3J0YW50LCBvciBhcmUKeW91IGp1c3QgZm9sbG93aW5nIGdvb2QgcHJhY3RpY2VzIGFu
ZCBiZWluZyBleHRyYSBwYXJhbm9pZD8gSWYgaXQncwphY3R1YWxseSBpbXBvcnRhbnQsIHRoaXMg
cHJvYmFibHkgYWxzbyBuZWVkcyB0byBiZSBDQ2VkIHRvIHN0YWJsZSwKcmlnaHQ/IFRoZSBvbGQg
Y29kZSBqdXN0IGFzc3VtZWQgdGhhdCBpdCAgY291bGQgY29weSB0aGUgd2hvbGUgYnVmZmVyCmlu
dG8gdG1wYnVmZmVyLiBJIGFzc3VtZSB0aGF0IHdhcyBPSywgYnV0IGl0IHdhc24ndCBkb2N1bWVu
dGVkIGluIHRoZQpmdW5jdGlvbiBjb21tZW50cyB0aGF0IHRoZXJlIHdhcyBhIG1heGltdW0gc2l6
ZSB0aGF0IGJ1ZmZlciBjb3VsZApiZS4uLgoKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
